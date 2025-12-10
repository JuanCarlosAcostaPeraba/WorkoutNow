//
//  Exercise.swift
//  WorkoutNow
//
//  Created by Juan Carlos Acosta Perabá on 10/12/25.
//

import Foundation

struct Exercise: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var duration: Int?      // en segundos (opcional si es "al fallo")
    var reps: Int?          // opcional
    var restAfter: Int?     // descanso tras este ejercicio (segundos)

    init(
        id: UUID = UUID(),
        name: String,
        duration: Int? = nil,
        reps: Int? = nil,
        restAfter: Int? = nil
    ) {
        self.id = id
        self.name = name
        self.duration = duration
        self.reps = reps
        self.restAfter = restAfter
    }
}
