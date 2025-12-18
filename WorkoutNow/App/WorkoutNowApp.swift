//
//  WorkoutNowApp.swift
//  WorkoutNow
//
//  Created by Juan Carlos Acosta Perabá on 11/12/25.
//

import SwiftUI
import SwiftData

@main
struct WorkoutNowApp: App {
    var body: some Scene {
        WindowGroup {
            RoutineListView()
        }
        .modelContainer(for: [Routine.self, Exercise.self])
    }
}
