//
//  NavySealRoutineBuilder.swift
//  WorkoutNow
//
//  Created by Juan Carlos Acosta Perabá on 13/12/25.
//

import Foundation

enum NavySealRoutineBuilder {
    static func makeBasicSteps() -> [WorkoutStep] {
        [
            .init(kind: .warmup, title: "Walk / Jog", durationSeconds: 5 * 60),

            .init(kind: .exercise, title: "Push-ups (to failure)", durationSeconds: nil, reps: nil, notes: "To failure"),
            .init(kind: .exercise, title: "Squats", reps: 15),
            .init(kind: .rest, title: "Walk", durationSeconds: 30),

            .init(kind: .exercise, title: "Push-ups (to failure)", durationSeconds: nil, reps: nil, notes: "To failure"),
            .init(kind: .exercise, title: "Plank", durationSeconds: 20),
            .init(kind: .exercise, title: "Lunges", reps: 20, notes: "10 each leg"),
            .init(kind: .exercise, title: "Mountain climber", durationSeconds: 30),
            .init(kind: .rest, title: "Walk", durationSeconds: 60),

            .init(kind: .exercise, title: "Burpees / Jumping Jack", durationSeconds: 45, notes: "or 5 burpees"),
            .init(kind: .exercise, title: "Bear crawl", reps: 20, notes: "10 forward, 10 back"),
            .init(kind: .exercise, title: "Wall sit", durationSeconds: 40, notes: "35–45 secs"),
            .init(kind: .cooldown, title: "Walk", durationSeconds: 3 * 60),
        ]
    }
}
