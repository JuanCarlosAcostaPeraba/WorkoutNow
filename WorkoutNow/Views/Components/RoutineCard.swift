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
                .foregroundStyle(AppTheme.accent)

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
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .shadow(radius: 2)
        .padding(.horizontal)
    }
}

#Preview {
    RoutineCard(routine: Routine(
        name: "Navy SEAL",
        description: "Rutina sin material",
        exercises: []
    ))
}
