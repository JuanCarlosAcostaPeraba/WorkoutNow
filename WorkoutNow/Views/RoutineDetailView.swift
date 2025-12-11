//
//  RoutineListView.swift
//  WorkoutNow
//
//  Created by Juan Carlos Acosta Perabá on 10/12/25.
//

import SwiftUI

struct RoutineDetailView: View {

    let routine: Routine

    var body: some View {
        List {
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

#Preview {
    RoutineDetailView(routine: Routine(
        name: "Navy SEAL",
        description: "Demo",
        exercises: []
    ))
}
