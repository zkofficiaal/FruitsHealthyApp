//
//  NutritionView.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 21/08/2026.
//

import SwiftUI

// MARK: - Nutrition View
// Screen for tracking daily nutrition, macros, and water intake
struct NutritionView: View {
    @StateObject private var vm = NutritionViewModel()   // ViewModel for nutrition state

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // MARK: - Header
                // Top bar with back, title, and options
                HStack {
                    Image(systemName: "chevron.left")
                    Spacer()
                    Text("Nutrition").font(.h2)
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

                // MARK: - Donut Progress Ring
                // Circular chart showing nutrient breakdown
                DonutProgressRing(
                    segments: [vm.nutrition.carbs, vm.nutrition.protein, vm.nutrition.fats, vm.nutrition.others],
                    centerValue: "\(vm.nutrition.totalKcal)",
                    centerLabel: "kcal"
                )

                // MARK: - Nutrient Legend
                // List of nutrient values with percentages
                VStack(spacing: 10) {
                    nutrientLegendRow(vm.nutrition.carbs)
                    nutrientLegendRow(vm.nutrition.protein)
                    nutrientLegendRow(vm.nutrition.fats)
                    nutrientLegendRow(vm.nutrition.others)
                }
                .padding()
                .background(Color.appCard)
                .cornerRadius(16)

                // MARK: - Water Intake Card
                // Displays water intake progress with add button
                waterIntakeCard
            }
            .padding(16)
        }
        .background(Color.appBackground.ignoresSafeArea())
    }

    // MARK: - Nutrient Legend Row
    private func nutrientLegendRow(_ nutrient: NutrientBreakdown) -> some View {
        HStack {
            Circle().fill(Color(hex: nutrient.colorHex)).frame(width: 10, height: 10)
            Text(nutrient.label).font(.captionText)
            Spacer()
            Text("\(nutrient.grams)g").font(.captionText.bold())
            Text("\(nutrient.percent)%").font(.captionText).foregroundColor(.appTextGray)
        }
    }

    // MARK: - Water Intake Card
    private var waterIntakeCard: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Water Intake").font(.bodyText.bold())
                Text("\(vm.nutrition.waterGlasses) / \(vm.nutrition.waterGoal) Glasses")
                    .font(.captionText).foregroundColor(.appTextGray)
            }
            Spacer()
            Button { } label: {
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .frame(width: 30, height: 30)
                    .background(Color.appBlue)
                    .clipShape(Circle())
            }
        }
        .padding(16)
        .background(Color.appCard)
        .cornerRadius(16)
    }
}
