//
//  NutritionView.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 21/08/2026.
//

import SwiftUI

// MARK: - Nutrition View
// Screen for tracking daily nutrition, macros, and water intake
struct NutritionView: View {
    @StateObject private var vm = NutritionViewModel()   // ViewModel for nutrition state

    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(spacing: 20) {
                    // MARK: - Header
                    HStack {
                        Text(vm.selectedDate).font(.bodyText)
                        Spacer()
                        Button {
                            // TODO: Wire to calendar picker
                        } label: {
                            Image(systemName: "calendar")
                                .foregroundColor(.appTextDark)
                        }
                    }
                    .padding(12)
                    .background(Color.appCard)
                    .cornerRadius(12)


                    // MARK: - Date Card
                    HStack {
                        Text(vm.selectedDate).font(.bodyText)
                        Spacer()
                        Button {
                            // TODO: Wire to calendar picker
                        } label: {
                            Image(systemName: "calendar")
                                .foregroundColor(.appTextDark)
                        }
                    }
                    .padding(12)
                    .background(Color.appCard)
                    .cornerRadius(12)


                    // MARK: - Donut Progress Ring
                    // Circular chart showing nutrient breakdown, sized relative to screen width
                    DonutProgressRing(
                        segments: [vm.nutrition.carbs, vm.nutrition.protein, vm.nutrition.fats, vm.nutrition.others],
                        centerValue: "\(vm.nutrition.totalKcal)",
                        centerLabel: "kcal",
                        size: geo.size.width * 0.42
                    )
                    .frame(maxWidth: .infinity)

                    // MARK: - Nutrient Legend
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
                    waterIntakeCard
                }
                .padding(.horizontal, geo.size.width * 0.045)
                .padding(.vertical, 16)
                .frame(minWidth: geo.size.width)
            }
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
