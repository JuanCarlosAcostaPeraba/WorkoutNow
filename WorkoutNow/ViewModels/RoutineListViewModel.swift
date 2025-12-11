//
//  RoutineListViewModel.swift
//  WorkoutNow
//
//  Created by Juan Carlos Acosta Perabá on 10/12/25.
//

import Foundation
import Combine

@MainActor
final class RoutineListViewModel: ObservableObject {

    @Published var routines: [Routine] = []

    init() {
        loadMockRoutines()
    }

    private func loadMockRoutines() {
        routines = [
            Routine(
                name: "Navy SEAL (Básico)",
                description: "Rutina sin material. Nivel básico.",
                exercises: [
                    Exercise(name: "Caminar / Trotar", duration: 5 * 60),
                    Exercise(name: "Flexiones (bien hechas) — al fallo"),
                    Exercise(name: "Sentadillas", reps: 15),
                    Exercise(name: "Caminar", duration: 30),
                    Exercise(name: "Flexiones — al fallo"),
                    Exercise(name: "Plancha", duration: 20),
                    Exercise(name: "Zancadas", reps: 20),
                    Exercise(name: "Mountain climber", duration: 30),
                    Exercise(name: "Caminar", duration: 60),
                    Exercise(name: "Burpees / Jumping Jack", reps: 5),
                    Exercise(name: "Caminar como oso", reps: 20),
                    Exercise(name: "Sentadilla estática pared", duration: 40),
                    Exercise(name: "Caminar", duration: 3 * 60)
                ]
            )
        ]
    }
}
