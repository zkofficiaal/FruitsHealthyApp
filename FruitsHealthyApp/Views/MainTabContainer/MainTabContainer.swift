import SwiftUI

// MARK: - Main Tab Container
// Hosts tab views and handles add sheet presentation
struct MainTabContainer: View {
    @EnvironmentObject var router: AppRouter

    var body: some View {
        VStack(spacing: 0) {
            Group {
                switch router.selectedTab {
                case .home: HomeView()
                case .fruits: FruitsView()
                case .stats: StatisticsView()
                case .profile: MealPlanView()
                }
            }

            // Custom tab bar with add button wired to router
            CustomTabBar(selectedTab: $router.selectedTab) {
                router.presentAddSheet()
            }
        }
        .background(Color.appBackground.ignoresSafeArea())
        .sheet(isPresented: $router.showAddSheet) {
            QuickAddSheet()
        }
    }
}
