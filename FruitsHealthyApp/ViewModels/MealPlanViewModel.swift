import Foundation
import Combine

// MARK: - Meal Plan ViewModel
// Handles meal list, kcal tracking, and progress updates
final class MealPlanViewModel: ObservableObject {
    @Published var selectedDate: String = "Today, 20 May"
    @Published var meals: [Meal] = Meal.sample
    @Published var currentKcal: Int = 1200
    @Published var goalKcal: Int = 2000

    // MARK: - Progress Percent
    var progressPercent: Int {
        Int((Double(currentKcal) / Double(goalKcal)) * 100)
    }

    // MARK: - Log Meal
    func logMeal(_ meal: Meal) {
        currentKcal += meal.kcal
        // Hook point for persistence, history, or analytics later
    }
}
