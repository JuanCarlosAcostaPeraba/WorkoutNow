//
//  RoutineListView.swift
//  WorkoutNow
//
//  Created by Juan Carlos Acosta Perabá on 10/12/25.
//

import SwiftUI
import SwiftData

struct RoutineListView: View {

    @Environment(\.modelContext) private var context
    @Query(sort: \Routine.name) private var routines: [Routine]

    var body: some View {
        NavigationStack {
            ZStack {
                AppTheme.gradientBackground
                    .ignoresSafeArea()

                List(routines) { routine in
                    NavigationLink(destination: RoutineDetailView(routine: routine)) {
                        RoutineCard(routine: routine)
                    }
                }
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("Rutinas")
        }
        .onAppear {
            seedIfNeeded()
        }
    }

    // MARK: - Seed initial routines (MVP)

    private func seedIfNeeded() {
        guard routines.isEmpty else { return }

        let navySeal = makeNavySealRoutine()
        let functional = makeFunctionalStrengthStationsRoutine()

        context.insert(navySeal)
        context.insert(functional)
    }

    private func makeNavySealRoutine() -> Routine {
        let exercises: [Exercise] = [
            Exercise(name: "Caminar / Trotar", duration: 5 * 60),
            Exercise(name: "Flexiones (bien hechas) — al fallo"),
            Exercise(name: "Sentadillas", reps: 15),
            Exercise(name: "Caminar", duration: 30),
            Exercise(name: "Flexiones — al fallo"),
            Exercise(name: "Plancha", duration: 20),
            Exercise(name: "Zancadas", reps: 20),
            Exercise(name: "Mountain climber", duration: 30),
            Exercise(name: "Caminar", duration: 60),
            Exercise(name: "Burpees / Jumping Jack", duration: 45),
            Exercise(name: "Caminar como oso", reps: 20),
            Exercise(name: "Sentadilla estática pared", duration: 40),
            Exercise(name: "Caminar", duration: 3 * 60)
        ]

        return Routine(
            name: "Navy SEAL (Básico)",
            description: "Rutina sin material. Nivel básico.",
            exercises: exercises
        )
    }

    private func makeFunctionalStrengthStationsRoutine() -> Routine {
        var exercises: [Exercise] = []

        func addRounds(_ titlePrefix: String, roundNames: [String]) {
            for (index, name) in roundNames.enumerated() {
                exercises.append(
                    Exercise(
                        name: "\(titlePrefix) · R\(index + 1) — \(name)",
                        duration: 30
                    )
                )
            }
        }

        // Estación 1 — Remo (18 rondas, variando agarre)
        let rowGrips: [String] = [
            "Agarre normal", "Agarre normal",
            "Agarre de bíceps", "Agarre de bíceps",
            "Uno arriba / otro abajo", "Uno arriba / otro abajo",
            "Uno arriba / otro abajo invertido", "Uno arriba / otro abajo invertido",
            "Agarre preferido (intenso)",
            "Agarre normal", "Agarre normal",
            "Agarre de bíceps", "Agarre de bíceps",
            "Uno arriba / otro abajo", "Uno arriba / otro abajo",
            "Uno arriba / otro abajo invertido", "Uno arriba / otro abajo invertido",
            "Agarre preferido (intenso)"
        ]
        addRounds("Estación 1 · Remo", roundNames: rowGrips)

        // Estación 1 — Correr (18 rondas)
        addRounds("Estación 1 · Correr", roundNames: Array(repeating: "Cinta o elíptica", count: 18))

        // Estación 2
        let station2: [String] = [
            "Sentadillas con pesa rusa",
            "Abdominales twist ruso",
            "Abdominales rodilla-centro-rodilla",
            "Sentadillas con pesa rusa",
            "Plancha lateral",
            "Plancha lateral (otro lado)",
            "Sentadillas con pesa rusa",
            "Plancha lateral con movimiento oblicuo",
            "Plancha lateral con movimiento oblicuo (otro lado)",
            "Sentadillas con pesa rusa",
            "Abdominales twist ruso",
            "Abdominales rodilla-centro-rodilla",
            "Sentadillas con pesa rusa",
            "Plancha lateral",
            "Plancha lateral (otro lado)",
            "Sentadillas con pesa rusa",
            "Plancha lateral con movimiento oblicuo",
            "Plancha lateral con movimiento oblicuo (otro lado)"
        ]
        addRounds("Estación 2", roundNames: station2)

        // Estación 3
        let station3: [String] = [
            "Zancada hacia atrás",
            "Abdominales twist ruso",
            "Abdominales rodilla-centro-rodilla",
            "Zancada hacia atrás",
            "Plancha lateral",
            "Plancha lateral (otro lado)",
            "Zancada hacia atrás",
            "Plancha lateral con movimiento oblicuo",
            "Plancha lateral con movimiento oblicuo (otro lado)",
            "Zancada hacia atrás",
            "Abdominales twist ruso",
            "Abdominales rodilla-centro-rodilla",
            "Zancada hacia atrás",
            "Plancha lateral",
            "Plancha lateral (otro lado)",
            "Zancada hacia atrás",
            "Plancha lateral con movimiento oblicuo",
            "Plancha lateral con movimiento oblicuo (otro lado)"
        ]
        addRounds("Estación 3", roundNames: station3)

        // Estación 4
        let station4: [String] = [
            "Flexión a 4 tiempos",
            "Abdominales twist ruso",
            "Abdominales rodilla-centro-rodilla",
            "Flexión a 4 tiempos",
            "Plancha lateral",
            "Plancha lateral (otro lado)",
            "Flexión a 4 tiempos",
            "Plancha lateral con movimiento oblicuo",
            "Plancha lateral con movimiento oblicuo (otro lado)",
            "Flexión a 4 tiempos",
            "Abdominales twist ruso",
            "Abdominales rodilla-centro-rodilla",
            "Flexión a 4 tiempos",
            "Plancha lateral",
            "Plancha lateral (otro lado)",
            "Flexión a 4 tiempos",
            "Plancha lateral con movimiento oblicuo",
            "Plancha lateral con movimiento oblicuo (otro lado)"
        ]
        addRounds("Estación 4", roundNames: station4)

        return Routine(
            name: "Fuerza funcional (Estaciones)",
            description: "4 estaciones · 18 rondas de 30s. Enfocado a fuerza funcional.",
            exercises: exercises
        )
    }
}

#Preview {
    RoutineListView()
}
