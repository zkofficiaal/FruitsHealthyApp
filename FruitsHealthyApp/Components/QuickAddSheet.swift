//
//  QuickAddSheet.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 27/08/2026.
//

import SwiftUI

// MARK: - Quick Add Sheet
// Bottom sheet for fast actions: add fruit, add meal, log water
struct QuickAddSheet: View {
    @EnvironmentObject var router: AppRouter       // Router for navigation
    @EnvironmentObject var store: NutritionStore  // Store for nutrition actions
    @Environment(\.dismiss) private var dismiss    // Dismiss environment action

    var body: some View {
        VStack(spacing: 20) {
            // MARK: - Drag Handle
            Capsule()
                .fill(Color.appTextGray.opacity(0.3))
                .frame(width: 40, height: 5)
                .padding(.top, 10)

            // MARK: - Title
            Text("Quick Add")
                .font(.h1)

            // MARK: - Quick Add Options
            VStack(spacing: 12) {
                // Add Fruit → navigates to Fruits tab
                Button {
                    router.goToTab(.fruits)
                    dismiss()
                } label: {
                    quickAddRow(icon: "leaf.fill", title: "Add Fruit", color: .appGreen)
                }

                // Add Meal → navigates to Home tab
                Button {
                    router.goToTab(.home)
                    dismiss()
                } label: {
                    quickAddRow(icon: "fork.knife", title: "Add Meal", color: .appCoral)
                }

                // Log Water → increments water glasses in store
                Button {
                    store.addWaterGlass()
                    dismiss()
                } label: {
                    quickAddRow(icon: "drop.fill", title: "Log Water", color: .appBlue)
                }
            }
            .padding(.horizontal, 20)

            Spacer()
        }
        .presentationDetents([.height(320)])   // Fixed sheet height
    }

    // MARK: - Quick Add Row
    private func quickAddRow(icon: String, title: String, color: Color) -> some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.white)
                .frame(width: 36, height: 36)
                .background(color)
                .clipShape(Circle())
            Text(title)
                .font(.bodyText.bold())
                .foregroundColor(.appTextDark)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.appTextGray)
        }
        .padding(14)
        .background(Color.appBackground)
        .cornerRadius(14)
    }
}
