//
//  WorkoutPlayerViewModel.swift
//  WorkoutNow
//
//  Created by Juan Carlos Acosta Perabá on 11/12/25.
//

import Foundation
import Combine
import SwiftUI

#if canImport(UIKit)
import UIKit
import AudioToolbox
#endif

@MainActor
final class WorkoutPlayerViewModel: ObservableObject {

    enum State: Equatable {
        case idle
        case running
        case finished
        case paused
    }

#if canImport(UIKit)
    private let notificationHaptics = UINotificationFeedbackGenerator()
    private let impactHaptics = UIImpactFeedbackGenerator(style: .medium)
#endif

    @Published private(set) var steps: [WorkoutStep]
    @Published private(set) var index: Int = 0
    @Published private(set) var state: State = .idle
    @Published var remainingSeconds: Int = 0

    private var timer: Timer?

    init(steps: [WorkoutStep]) {
        self.steps = steps
        primeCurrentStep()
    }

    var current: WorkoutStep? {
        guard steps.indices.contains(index) else { return nil }
        return steps[index]
    }

    var progressText: String {
        "\(min(index + 1, steps.count))/\(steps.count)"
    }

    func start() {
        guard state != .running else { return }
        state = .running
        prepareFeedback()
        runTimerIfNeeded()
    }

    func pause() {
        guard state == .running else { return }
        state = .paused
        stopTimer()
    }

    func resume() {
        guard state == .paused else { return }
        state = .running
        prepareFeedback()
        runTimerIfNeeded()
    }

    func next() {
        stopTimer()
        index += 1
        if index >= steps.count {
            state = .finished
            remainingSeconds = 0
            triggerFinishedFeedback()
            return
        }
        primeCurrentStep()
        triggerStepTransitionFeedback()
        if state == .running { runTimerIfNeeded() }
    }

    func previous() {
        stopTimer()
        index = max(0, index - 1)
        primeCurrentStep()
        triggerStepTransitionFeedback()
        if state == .running { runTimerIfNeeded() }
    }

    func reset() {
        stopTimer()
        index = 0
        state = .idle
        primeCurrentStep()
    }

    private func primeCurrentStep() {
        guard let step = current else { return }
        remainingSeconds = step.durationSeconds ?? 0
    }

    private func runTimerIfNeeded() {
        guard let step = current else { return }
        guard let duration = step.durationSeconds, duration > 0 else {
            // Steps sin tiempo (reps / al fallo) no usan timer en MVP
            remainingSeconds = 0
            return
        }

        // Si venimos de idle y no está inicializado:
        if remainingSeconds <= 0 { remainingSeconds = duration }

        stopTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self else { return }
            Task { @MainActor in
                guard self.state == .running else { return }
                self.tick()
            }
        }
    }

    private func tick() {
        if remainingSeconds > 0 {
            remainingSeconds -= 1
        } else {
            // Feedback + auto-advance when time ends
            triggerStepTransitionFeedback()
            next()
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    private func prepareFeedback() {
#if canImport(UIKit)
        notificationHaptics.prepare()
        impactHaptics.prepare()
#endif
    }

    private func triggerStepTransitionFeedback() {
#if canImport(UIKit)
        // Light haptic + subtle system sound
        impactHaptics.impactOccurred()
        AudioServicesPlaySystemSound(1104)
        impactHaptics.prepare()
#endif
    }

    private func triggerFinishedFeedback() {
#if canImport(UIKit)
        notificationHaptics.notificationOccurred(.success)
        AudioServicesPlaySystemSound(1110)
        notificationHaptics.prepare()
#endif
    }

    deinit {
        timer?.invalidate()
    }
}
