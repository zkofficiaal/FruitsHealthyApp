import SwiftUI

struct RootView: View {
    @EnvironmentObject var router: AppRouter

    var body: some View {
        Group {
            if router.showOnboarding {
                OnboardingView()
            } else {
                MainTabContainer()
            }
        }
    }
}
