//
//  RoutineListView.swift
//  WorkoutNow
//
//  Created by Juan Carlos Acosta Perabá on 10/12/25.
//

import SwiftUI

struct RoutineListView: View {

    @StateObject private var viewModel = RoutineListViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.routines) { routine in
                NavigationLink(destination: RoutineDetailView(routine: routine)) {
                    RoutineCard(routine: routine)
                }
            }
            .navigationTitle("Rutinas")
        }
    }
}

#Preview {
    RoutineListView()
}
