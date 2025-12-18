//
//  AppTheme.swift
//  WorkoutNow
//
//  Created by Juan Carlos Acosta Perabá on 11/12/25.
//

import Foundation
import SwiftUI

enum AppTheme {
    static let accent = Color.blue

    static let gradientBackground = LinearGradient(
        colors: [
            Color.black.opacity(0.95),
            Color.blue.opacity(0.75)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
