//
//  Exercise.swift
//  WorkoutNow
//
//  Created by Juan Carlos Acosta Perabá on 10/12/25.
//

import Foundation
import SwiftData

@Model
final class Exercise {
    var name: String
    var duration: Int?      // en segundos (opcional si es "al fallo")
    var reps: Int?          // opcional
    var restAfter: Int?     // descanso tras este ejercicio (segundos)

    init(
        name: String,
        duration: Int? = nil,
        reps: Int? = nil,
        restAfter: Int? = nil
    ) {
        self.name = name
        self.duration = duration
        self.reps = reps
        self.restAfter = restAfter
    }
}
