//
//  WorkoutPlayerView.swift
//  WorkoutNow
//
//  Created by Juan Carlos Acosta Perabá on 11/12/25.
//

import SwiftUI

struct WorkoutPlayerView: View {
    @StateObject private var vm: WorkoutPlayerViewModel

    init(steps: [WorkoutStep]) {
        _vm = StateObject(wrappedValue: WorkoutPlayerViewModel(steps: steps))
    }

    var body: some View {
        VStack(spacing: 16) {
            header
            card
            controls
            Spacer()
        }
        .padding()
        .navigationTitle("Workout")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var header: some View {
        HStack {
            Text(vm.progressText)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            Spacer()
            if vm.state == .running {
                Button("Pause") { vm.pause() }
            } else if vm.state == .paused {
                Button("Resume") { vm.resume() }
            } else {
                Button("Start") { vm.start() }
            }
        }
    }

    private var card: some View {
        Group {
            if vm.state == .finished {
                VStack(spacing: 10) {
                    Text("Finished 🎉").font(.title2).bold()
                    Button("Restart") { vm.reset() }
                }
                .frame(maxWidth: .infinity, minHeight: 220)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
            } else if let step = vm.current {
                VStack(spacing: 10) {
                    Text(stepTitle(step))
                        .font(.title2).bold()
                        .multilineTextAlignment(.center)

                    if let secs = step.durationSeconds, secs > 0 {
                        Text(format(secs: vm.remainingSeconds))
                            .font(.system(size: 44, weight: .semibold, design: .rounded))
                            .monospacedDigit()
                    } else if let reps = step.reps {
                        Text("\(reps) reps")
                            .font(.system(size: 40, weight: .semibold, design: .rounded))
                    } else {
                        Text(step.notes ?? "Go!")
                            .font(.title3)
                            .foregroundStyle(.secondary)
                    }

                    if let notes = step.notes {
                        Text(notes)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
                .frame(maxWidth: .infinity, minHeight: 220)
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
            }
        }
    }

    private var controls: some View {
        HStack(spacing: 12) {
            Button("Back") { vm.previous() }
                .buttonStyle(.bordered)

            Button("Next") { vm.next() }
                .buttonStyle(.borderedProminent)
        }
        .disabled(vm.state == .finished)
    }

    private func stepTitle(_ step: WorkoutStep) -> String {
        switch step.kind {
        case .warmup: return "Warm-up · \(step.title)"
        case .exercise: return step.title
        case .rest: return "Rest · \(step.title)"
        case .cooldown: return "Cool-down · \(step.title)"
        }
    }

    private func format(secs: Int) -> String {
        let m = secs / 60
        let s = secs % 60
        return String(format: "%02d:%02d", m, s)
    }
}
