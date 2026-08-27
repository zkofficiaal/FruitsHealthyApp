//
//  NutritionStore.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 27/08/2026.
//

import Foundation
import SwiftUI

// MARK: - Nutrition Store
// Centralized state manager (single source of truth) for nutrition data
final class NutritionStore: ObservableObject {
    // MARK: - Profile
    @Published var userName: String = "Olivia"      // User name
    @Published var calorieGoal: Int = 2000          // Daily kcal goal
    @Published var waterGoal: Int = 8               // Daily water goal (glasses)

    // MARK: - Today's Consumption
    @Published var consumedKcal: Int = 0
    @Published var carbsGrams: Int = 0
    @Published var proteinGrams: Int = 0
    @Published var fatsGrams: Int = 0
    @Published var othersGrams: Int = 0
    @Published var waterGlasses: Int = 0
    @Published var todaysItems: [String] = []       // Logged items for today

    // MARK: - Favorites
    @Published var favoriteFruitIDs: Set<UUID> = [] // Track favorite fruits

    // MARK: - Weekly History
    // Today’s bar reflects live consumedKcal
    @Published var weeklyEntries: [WeeklyIntake] = StatisticsData.sample.entries

    // MARK: - Derived Values
    var progress: Double {
        calorieGoal == 0 ? 0 : min(Double(consumedKcal) / Double(calorieGoal), 1)
    }

    var remainingKcal: Int {
        max(calorieGoal - consumedKcal, 0)
    }

    var waterProgress: Double {
        waterGoal == 0 ? 0 : min(Double(waterGlasses) / Double(waterGoal), 1)
    }

    var hasLoggedToday: Bool { !todaysItems.isEmpty }

    var nutrientBreakdown: [NutrientBreakdown] {
        let total = max(carbsGrams + proteinGrams + fatsGrams + othersGrams, 1)
        func pct(_ g: Int) -> Int { Int((Double(g) / Double(total)) * 100) }
        return [
            NutrientBreakdown(label: "Carbs", grams: carbsGrams, percent: pct(carbsGrams), colorHex: "5FA8D3"),
            NutrientBreakdown(label: "Protein", grams: proteinGrams, percent: pct(proteinGrams), colorHex: "4CAF88"),
            NutrientBreakdown(label: "Fats", grams: fatsGrams, percent: pct(fatsGrams), colorHex: "F5C34D"),
            NutrientBreakdown(label: "Others", grams: othersGrams, percent: pct(othersGrams), colorHex: "9B8CD9")
        ]
    }

    // MARK: - Actions
    /// Add fruit servings to today’s log and update macros
    func addFruit(_ fruit: Fruit, servings: Int) {
        guard servings > 0 else { return }
        consumedKcal += fruit.kcal * servings
        carbsGrams += fruit.carbsG * servings
        proteinGrams += fruit.proteinG * servings
        fatsGrams += fruit.fatG * servings
        todaysItems.append("\(servings)x \(fruit.name)")
        syncTodayIntoWeekly()
    }

    /// Add a meal to today’s log (approximate macro split)
    func addMeal(_ meal: Meal) {
        consumedKcal += meal.kcal
        carbsGrams += Int(Double(meal.kcal) * 0.5 / 4)
        proteinGrams += Int(Double(meal.kcal) * 0.25 / 4)
        fatsGrams += Int(Double(meal.kcal) * 0.25 / 9)
        todaysItems.append(meal.subtitle)
        syncTodayIntoWeekly()
    }

    /// Increment water intake
    func addWaterGlass() {
        if waterGlasses < waterGoal { waterGlasses += 1 }
    }

    /// Decrement water intake
    func removeWaterGlass() {
        if waterGlasses > 0 { waterGlasses -= 1 }
    }

    /// Toggle fruit as favorite
    func toggleFavorite(_ fruit: Fruit) {
        if favoriteFruitIDs.contains(fruit.id) {
            favoriteFruitIDs.remove(fruit.id)
        } else {
            favoriteFruitIDs.insert(fruit.id)
        }
    }

    /// Check if fruit is favorite
    func isFavorite(_ fruit: Fruit) -> Bool {
        favoriteFruitIDs.contains(fruit.id)
    }

    // MARK: - Sync
    /// Update weekly entries with today’s kcal
    private func syncTodayIntoWeekly() {
        guard let lastIndex = weeklyEntries.indices.last else { return }
        let last = weeklyEntries[lastIndex]
        weeklyEntries[lastIndex] = WeeklyIntake(day: last.day, kcal: consumedKcal)
    }
}
