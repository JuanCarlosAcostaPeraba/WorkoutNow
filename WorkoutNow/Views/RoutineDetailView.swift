//
//  RoutineDetailView.swift
//  WorkoutNow
//
//  Created by Juan Carlos Acosta Perabá on 10/12/25.
//

import SwiftUI

struct RoutineDetailView: View {

    let routine: Routine

    var body: some View {
        List {
            Section {
                NavigationLink {
                    WorkoutPlayerView(steps: routine.toWorkoutSteps())
                } label: {
                    HStack {
                        Label("Start", systemImage: "play.fill")
                        Spacer()
                    }
                }
            }
            ForEach(routine.exercises) { ex in
                HStack {
                    Text(ex.name)

                    Spacer()

                    if let reps = ex.reps {
                        Text("\(reps) reps")
                            .foregroundStyle(.secondary)
                    } else if let duration = ex.duration {
                        Text("\(duration)s")
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        .navigationTitle(routine.name)
    }
}

private extension Routine {
    func toWorkoutSteps() -> [WorkoutStep] {
        exercises.map { ex in
            WorkoutStep(
                kind: .exercise,
                title: ex.name,
                durationSeconds: ex.duration,
                reps: ex.reps,
                notes: nil
            )
        }
    }
}

#Preview {
    RoutineDetailView(routine: Routine(
        name: "Navy SEAL",
        description: "Demo",
        exercises: []
    ))
}
