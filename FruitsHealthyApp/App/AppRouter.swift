import SwiftUI
import Combine
// MARK: - App Tabs
enum AppTab: Equatable {
    case home, fruits, stats, profile
}

// MARK: - App Router
// Handles onboarding, tab navigation, and sheet presentation
final class AppRouter: ObservableObject {
    @Published var showOnboarding: Bool = true
    @Published var selectedTab: AppTab = .home
    @Published var showAddSheet: Bool = false

    // MARK: - Navigation
    func completeOnboarding() {
        withAnimation { showOnboarding = false }
    }

    func goBackToHome() {
        withAnimation { selectedTab = .home }
    }

    // MARK: - Sheet Presentation
    func presentAddSheet() {
        withAnimation { showAddSheet = true }
    }

    // MARK: - Reset State
    func reset() {
        showOnboarding = true
        selectedTab = .home
        showAddSheet = false
    }
}
