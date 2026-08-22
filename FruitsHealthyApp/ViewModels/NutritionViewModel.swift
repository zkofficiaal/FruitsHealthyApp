//
//  NutritionViewModel.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 21/08/2026.
//

import Foundation
import Combine

// MARK: - Nutrition ViewModel
// Manages nutrition data and selected date
final class NutritionViewModel: ObservableObject {
    @Published var nutrition: DailyNutrition = .sample
    // Holds daily nutrition data (sample by default)

    @Published var selectedDate: String = "Today, 20 May"
    // Tracks currently selected date for nutrition stats
}
