//
//  MainTabContainer.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 21/08/2026.
//

import SwiftUI

// MARK: - Main Tab Container
struct MainTabContainer: View {
    @EnvironmentObject var router: AppRouter
    // Shared router object to track selected tab

    var body: some View {
        VStack(spacing: 0) {
            Group {
                switch router.selectedTab {
                case .home: HomeView()        // Shows Home screen
                case .fruits: FruitsView()    // Shows Fruits screen
                case .stats: StatisticsView() // Shows Statistics screen
                case .profile: MealPlanView() // Shows Meal Plan/Profile screen
                }
            }
            CustomTabBar(selectedTab: $router.selectedTab)
            // Bottom tab bar bound to router for navigation
        }
        .background(Color.appBackground.ignoresSafeArea())
        // Sets global background color ignoring safe area
    }
}
