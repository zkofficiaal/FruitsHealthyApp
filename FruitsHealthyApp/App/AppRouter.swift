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

    func completeOnboarding() {
        withAnimation { showOnboarding = false }
    }

    func goBackToHome() {
        withAnimation { selectedTab = .home }
    }

    func presentAddSheet() {
        withAnimation { showAddSheet = true }
    }

    func goToTab(_ tab: AppTab) {
        withAnimation { selectedTab = tab }
    }
}
