//
//  OnboardingViewModel.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 27/08/2026.
//

import Foundation

// MARK: - Onboarding ViewModel
// Manages onboarding steps, user input, and applies settings to NutritionStore
final class OnboardingViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var step: Int = 0                  // Current onboarding step
    @Published var name: String = ""              // User name input
    @Published var calorieGoalText: String = "2000" // Text field for calorie goal
    @Published var waterGoalText: String = "8"      // Text field for water goal

    // MARK: - Computed Properties
    var isLastStep: Bool { step == 3 }            // Check if onboarding is at final step

    // MARK: - Navigation Methods
    /// Move forward in onboarding flow
    func next() {
        if step < 3 { step += 1 }
    }

    /// Move backward in onboarding flow
    func back() {
        if step > 0 { step -= 1 }
    }

    // MARK: - Apply Settings
    /// Apply onboarding values to NutritionStore
    func apply(to store: NutritionStore) {
        store.userName = name.isEmpty ? "Guest" : name
        store.calorieGoal = Int(calorieGoalText) ?? 2000
        store.waterGoal = Int(waterGoalText) ?? 8
    }
}
