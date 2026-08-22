//
//  AppRouter.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 21/08/2026.
//
import SwiftUI
import Combine

// MARK: - App Tabs
enum AppTab {
    case home, fruits, stats, profile
    // Represents the four main tabs in the app
}

// MARK: - Router
final class AppRouter: ObservableObject {
    @Published var showOnboarding: Bool = true
    // Controls whether onboarding is shown or not

    @Published var selectedTab: AppTab = .home
    // Tracks which tab is currently active

    func completeOnboarding() {
        withAnimation { showOnboarding = false }
        // Transition smoothly from onboarding to main tabs
    }
}

