//
//  RoutineDetailView.swift
//  WorkoutNow
//
//  Created by Juan Carlos Acosta Perabá on 10/12/25.
//

import SwiftUI

struct RoutineCard: View {
    let routine: Routine

    var body: some View {
        HStack {
            Image(systemName: routine.iconName)
                .font(.largeTitle)
                .foregroundStyle(.blue)

            VStack(alignment: .leading) {
                Text(routine.name)
                    .font(.headline)

                if let desc = routine.details {
                    Text(desc)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }

            Spacer()
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    RoutineCard(routine: Routine(
        name: "Navy SEAL",
        description: "Rutina sin material",
        exercises: []
    ))
}
