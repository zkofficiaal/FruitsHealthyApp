//
//  CustomTabBar.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 21/08/2026.
//

import SwiftUI

// MARK: - Custom Tab Bar
// Reusable bottom tab bar with icons and center add button
struct CustomTabBar: View {
    @Binding var selectedTab: AppTab   // Currently selected tab

    var body: some View {
        HStack {
            tabIcon(.home, "house.fill")
            Spacer()
            tabIcon(.fruits, "leaf.fill")
            Spacer()
            centerAddButton
            Spacer()
            tabIcon(.stats, "chart.bar.fill")
            Spacer()
            tabIcon(.profile, "person.fill")
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 14)
        .background(Color.appCard)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .shadow(color: .black.opacity(0.06), radius: 8, y: -2)
        .padding(.horizontal)
        .padding(.bottom, 8)
    }

    // MARK: - Tab Icon
    // Creates a tab icon with active/inactive state
    private func tabIcon(_ tab: AppTab, _ symbol: String) -> some View {
        Image(systemName: symbol)
            .font(.system(size: 18))
            .foregroundColor(selectedTab == tab ? .appGreen : .appTextGray)
            .onTapGesture { selectedTab = tab }
    }

    // MARK: - Center Add Button
    // Prominent circular add button in the middle
    private var centerAddButton: some View {
        Image(systemName: "plus")
            .font(.system(size: 18, weight: .bold))
            .foregroundColor(.white)
            .frame(width: 44, height: 44)
            .background(Color.appGreen)
            .clipShape(Circle())
    }
}

// MARK: - AppTab Equatable
extension AppTab: Equatable {}

