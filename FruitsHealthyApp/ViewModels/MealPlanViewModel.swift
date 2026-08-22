//
//  MealPlanViewModel.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 21/08/2026.
//

import Foundation
import Combine

// MARK: - Meal Plan ViewModel
// Manages daily meal plan, calories, and progress tracking
final class MealPlanViewModel: ObservableObject {
    @Published var selectedDate: String = "Today, 20 May"
    // Tracks currently selected date for meal plan

    @Published var meals: [Meal] = Meal.sample
    // Holds list of meals for the day

    @Published var currentKcal: Int = 1200
    // Current calories consumed

    @Published var goalKcal: Int = 2000
    // Daily calorie goal

    var progressPercent: Int {
        Int((Double(currentKcal) / Double(goalKcal)) * 100)
        // Calculates progress percentage towards daily goal
    }
}

