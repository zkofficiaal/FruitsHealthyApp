import SwiftUI
import Combine

// MARK: - App Tabs
enum AppTab: Equatable {
    case home, fruits, stats, profile
}

// MARK: - Router
// Central navigation/state controller shared across the whole app
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

    func goToTab(_ tab: AppTab) {
        withAnimation { selectedTab = tab }
    }

    func presentAddSheet() {
        showAddSheet = true
    }
}
