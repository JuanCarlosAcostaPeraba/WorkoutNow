//
//  Routine.swift
//  WorkoutNow
//
//  Created by Juan Carlos Acosta Perabá on 10/12/25.
//

import Foundation

struct Routine: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var description: String?
    var exercises: [Exercise]

    init(
        id: UUID = UUID(),
        name: String,
        description: String? = nil,
        exercises: [Exercise]
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.exercises = exercises
    }
}
