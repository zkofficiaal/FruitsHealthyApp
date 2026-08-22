import SwiftUI
import Combine
// MARK: - Root View
struct RootView: View {
    @EnvironmentObject var router: AppRouter
    // Shared router object to control onboarding and tab navigation

    var body: some View {
        Group {
            if router.showOnboarding {
                OnboardingView()
                // Displays onboarding screen when showOnboarding is true
            } else {
                MainTabContainer()
                // Displays main tab container after onboarding is complete
            }
        }
    }
}
