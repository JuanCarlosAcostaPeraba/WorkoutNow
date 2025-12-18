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
            RootView()
        }
        .modelContainer(for: [Routine.self, Exercise.self])
    }
}

struct RootView: View {
    var body: some View {
        TabView {
            RoutineListView()
                .tabItem {
                    Label("Rutinas", systemImage: "list.bullet")
                }

            PlaceholderView(title: "Calendario")
                .tabItem {
                    Label("Calendario", systemImage: "calendar")
                }

            PlaceholderView(title: "Ajustes")
                .tabItem {
                    Label("Ajustes", systemImage: "gearshape")
                }
        }
        .tint(.blue)
        .toolbarBackground(.ultraThinMaterial, for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
    }
}

struct PlaceholderView: View {
    let title: String

    var body: some View {
        ZStack {
            AppTheme.gradientBackground
            .ignoresSafeArea()

            Text(title)
                .font(.headline)
                .foregroundStyle(.white)
        }
    }
}
