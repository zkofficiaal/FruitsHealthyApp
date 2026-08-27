import SwiftUI

// MARK: - Root View
// Decides whether to show onboarding or main tab container
struct RootView: View {
    @EnvironmentObject var router: AppRouter   // Router for navigation state

    var body: some View {
        Group {
            // MARK: - Conditional Flow
            // If onboarding is active → show OnboardingView
            // Otherwise → show MainTabContainer
            if router.showOnboarding {
                OnboardingView()
            } else {
                MainTabContainer()
            }
        }
    }
}
