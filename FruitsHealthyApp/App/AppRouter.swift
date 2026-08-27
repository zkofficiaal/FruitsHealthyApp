import SwiftUI

// MARK: - App Tabs
// Enum representing the main tabs in the app
enum AppTab: Equatable {
    case home, fruits, stats, profile
}

// MARK: - App Router
// ObservableObject that manages navigation state across the app
final class AppRouter: ObservableObject {
    // MARK: - Published Properties
    @Published var showOnboarding: Bool = true      // Controls onboarding flow
    @Published var selectedTab: AppTab = .home      // Tracks current tab
    @Published var showAddSheet: Bool = false       // Controls add sheet presentation

    // MARK: - Navigation Methods
    /// Completes onboarding and transitions to main app
    func completeOnboarding() {
        withAnimation { showOnboarding = false }
    }

    /// Switches to a specific tab with animation
    func goToTab(_ tab: AppTab) {
        withAnimation { selectedTab = tab }
    }

    /// Presents the add sheet (e.g., for quick add actions)
    func presentAddSheet() {
        showAddSheet = true
    }
}
