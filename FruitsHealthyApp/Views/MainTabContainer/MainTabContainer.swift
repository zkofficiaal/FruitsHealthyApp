import SwiftUI

// MARK: - Main Tab Container
// Hosts the four main tabs and manages the add sheet presentation
struct MainTabContainer: View {
    @EnvironmentObject var router: AppRouter   // Shared router for navigation state

    var body: some View {
        VStack(spacing: 0) {
            // MARK: - Tab Content
            Group {
                switch router.selectedTab {
                case .home: HomeView()
                case .fruits: FruitsView()
                case .stats: StatisticsView()
                case .profile: ProfileView()
                }
            }

            // MARK: - Custom Tab Bar
            // Includes add button wired to router
            CustomTabBar(selectedTab: $router.selectedTab) {
                router.presentAddSheet()
            }
        }
        .background(Color.appBackground.ignoresSafeArea())
        // MARK: - Quick Add Sheet
        // Presents QuickAddSheet when showAddSheet is true
        .sheet(isPresented: $router.showAddSheet) {
            QuickAddSheet()
        }
    }
}
