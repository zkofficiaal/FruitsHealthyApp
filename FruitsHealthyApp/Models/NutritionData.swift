//
//  NutritionData.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 21/08/2026.
//

import Foundation

// MARK: - Nutrient Breakdown
struct NutrientBreakdown: Identifiable {
    let id = UUID()             // Unique identifier for each nutrient
    let label: String           // Nutrient name (Carbs, Protein, etc.)
    let grams: Int              // Amount in grams
    let percent: Int            // Percentage of daily intake
    let colorHex: String        // Hex color for chart visualization
}

// MARK: - Daily Nutrition
struct DailyNutrition {
    var totalKcal: Int          // Total calories consumed
    var goalKcal: Int           // Daily calorie goal
    var carbs: NutrientBreakdown // Carbohydrate breakdown
    var protein: NutrientBreakdown // Protein breakdown
    var fats: NutrientBreakdown   // Fat breakdown
    var others: NutrientBreakdown // Other nutrients breakdown
    var waterGlasses: Int        // Water consumed (glasses)
    var waterGoal: Int           // Daily water goal

    var progress: Double { Double(totalKcal) / Double(goalKcal) }
    // Progress ratio towards daily calorie goal

    // MARK: - Sample Daily Nutrition
    static let sample = DailyNutrition(
        totalKcal: 1200,
        goalKcal: 2000,
        carbs: NutrientBreakdown(label: "Carbs", grams: 150, percent: 50, colorHex: "5FA8D3"),
        protein: NutrientBreakdown(label: "Protein", grams: 75, percent: 25, colorHex: "4CAF88"),
        fats: NutrientBreakdown(label: "Fats", grams: 45, percent: 15, colorHex: "F5C34D"),
        others: NutrientBreakdown(label: "Others", grams: 30, percent: 10, colorHex: "9B8CD9"),
        waterGlasses: 6,
        waterGoal: 8
    )
}

// MARK: - Weekly Intake
struct WeeklyIntake: Identifiable {
    let id = UUID()             // Unique identifier for each day
    let day: String             // Day of the week
    let kcal: Int               // Calories consumed on that day
}

// MARK: - Statistics Data
struct StatisticsData {
    var weekTotalKcal: Int      // Total calories consumed in a week
    var highlightKcal: Int      // Highest daily calorie intake
    var entries: [WeeklyIntake] // Daily calorie entries
    var nutrientRatio: [NutrientBreakdown] // Nutrient ratio for charts

    // MARK: - Sample Weekly Statistics
    static let sample = StatisticsData(
        weekTotalKcal: 14560,
        highlightKcal: 2450,
        entries: [
            WeeklyIntake(day: "Mon", kcal: 1900),
            WeeklyIntake(day: "Tue", kcal: 2100),
            WeeklyIntake(day: "Wed", kcal: 1800),
            WeeklyIntake(day: "Thu", kcal: 2200),
            WeeklyIntake(day: "Fri", kcal: 2450),
            WeeklyIntake(day: "Sat", kcal: 2000),
            WeeklyIntake(day: "Sun", kcal: 2110)
        ],
        nutrientRatio: [
            NutrientBreakdown(label: "Carbs", grams: 0, percent: 50, colorHex: "5FA8D3"),
            NutrientBreakdown(label: "Protein", grams: 0, percent: 25, colorHex: "4CAF88"),
            NutrientBreakdown(label: "Fats", grams: 0, percent: 15, colorHex: "F5C34D"),
            NutrientBreakdown(label: "Others", grams: 0, percent: 10, colorHex: "9B8CD9")
        ]
    )
}
