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
            makeNavySealRoutine(),
            makeFunctionalStrengthStationsRoutine()
        ]
    }
    
    private func makeNavySealRoutine() -> Routine {
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
    }
    
    private func makeFunctionalStrengthStationsRoutine() -> Routine {
        var exercises: [Exercise] = []
        
        func addRounds(_ titlePrefix: String, roundNames: [String]) {
            for (i, name) in roundNames.enumerated() {
                exercises.append(
                    Exercise(
                        name: "\(titlePrefix) · R\(i + 1) — \(name)",
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

// MARK: - Routine Icon Mapping (MVP)
extension Routine {
    var iconName: String {
        switch name {
        case _ where name.contains("Navy SEAL"):
            return "figure.strengthtraining.traditional"
        case _ where name.contains("Fuerza funcional"):
            return "bolt.circle.fill"
        default:
            return "figure.walk"
        }
    }
}
