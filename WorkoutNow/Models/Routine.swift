//
//  Routine.swift
//  WorkoutNow
//
//  Created by Juan Carlos Acosta Perabá on 10/12/25.
//

import SwiftData

@Model
final class Routine {
    var name: String
    var details: String?
    @Relationship(deleteRule: .cascade) var exercises: [Exercise]

    init(
        name: String,
        description: String? = nil,
        exercises: [Exercise]
    ) {
        self.name = name
        self.details = description
        self.exercises = exercises
    }
}
