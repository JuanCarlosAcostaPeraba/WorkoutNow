//
//  WorkoutStep.swift
//  WorkoutNow
//
//  Created by Juan Carlos Acosta Perabá on 13/12/25.
//

import Foundation

enum WorkoutStepKind: String, Codable {
    case warmup
    case exercise
    case rest
    case cooldown
}

struct WorkoutStep: Identifiable, Codable, Hashable {
    let id: UUID
    let kind: WorkoutStepKind
    let title: String
    let durationSeconds: Int? // nil si es “al fallo” o reps
    let reps: Int?            // nil si es por tiempo
    let notes: String?

    init(
        id: UUID = UUID(),
        kind: WorkoutStepKind,
        title: String,
        durationSeconds: Int? = nil,
        reps: Int? = nil,
        notes: String? = nil
    ) {
        self.id = id
        self.kind = kind
        self.title = title
        self.durationSeconds = durationSeconds
        self.reps = reps
        self.notes = notes
    }
}
