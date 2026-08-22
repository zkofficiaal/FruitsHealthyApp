//
//  MealPlanView.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 21/08/2026.
//

import SwiftUI

// MARK: - Meal Plan View
// Screen for managing daily meals, kcal progress, and recommendations
struct MealPlanView: View {
    @StateObject private var vm = MealPlanViewModel()   // ViewModel for meal plan state

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // MARK: - Header
                // Top bar with back, title, and options
                HStack {
                    Image(systemName: "chevron.left")
                    Spacer()
                    Text("Meal Plan").font(.h2)
                    Spacer()
                    Image(systemName: "ellipsis")
                }

                // MARK: - Date Card
                // Shows selected date with calendar icon
                HStack {
                    Text(vm.selectedDate).font(.bodyText)
                    Spacer()
                    Image(systemName: "calendar")
                }
                .padding(12)
                .background(Color.appCard)
                .cornerRadius(12)

                // MARK: - Recommended Meals
                // List of suggested meals for the day
                Text("Recommended Meals").font(.h2)

                VStack(spacing: 10) {
                    ForEach(vm.meals) { meal in
                        MealRow(meal: meal) { }
                    }
                }

                // MARK: - Daily Progress Card
                // Displays kcal progress with percentage
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Daily Progress").font(.bodyText.bold())
                        Spacer()
                        Text("\(vm.currentKcal) / \(vm.goalKcal) kcal")
                            .font(.captionText)
                            .foregroundColor(.appTextGray)
                    }
                    ProgressView(value: Double(vm.currentKcal), total: Double(vm.goalKcal))
                        .tint(.appGreen)
                    Text("\(vm.progressPercent)%")
                        .font(.captionText)
                        .foregroundColor(.appGreen)
                }
                .padding(16)
                .background(Color.appCard)
                .cornerRadius(16)
            }
            .padding(16)
        }
        .background(Color.appBackground.ignoresSafeArea())
    }
}
