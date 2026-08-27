import Foundation

// MARK: - Nutrient Breakdown
// Represents a single nutrient with grams, percentage, and color
struct NutrientBreakdown: Identifiable, Equatable {
    let id = UUID()        // Unique identifier
    let label: String      // Nutrient name (Carbs, Protein, etc.)
    let grams: Int         // Amount in grams
    let percent: Int       // Percentage of total intake
    let colorHex: String   // Hex color for UI visualization
}

// MARK: - Weekly Intake
// Represents daily kcal intake for weekly statistics
struct WeeklyIntake: Identifiable {
    let id = UUID()        // Unique identifier
    let day: String        // Day of the week
    let kcal: Int          // Calories consumed
}

// MARK: - Statistics Data
// Holds weekly entries and provides sample data
struct StatisticsData {
    var entries: [WeeklyIntake]

    // MARK: - Sample Data
    // Static sample entries for previews/testing
    static let sample = StatisticsData(entries: [
        WeeklyIntake(day: "Mon", kcal: 1900),
        WeeklyIntake(day: "Tue", kcal: 2100),
        WeeklyIntake(day: "Wed", kcal: 1800),
        WeeklyIntake(day: "Thu", kcal: 2200),
        WeeklyIntake(day: "Fri", kcal: 2450),
        WeeklyIntake(day: "Sat", kcal: 2000),
        WeeklyIntake(day: "Sun", kcal: 0) // "today" — driven live by NutritionStore
    ])
}
