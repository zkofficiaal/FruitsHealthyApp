import Foundation

// MARK: - Meal Model
// Represents a meal with title, subtitle, kcal, image, and ingredients
struct Meal: Identifiable, Equatable, Hashable {
    let id = UUID()              // Unique identifier
    let title: String            // Meal type (Breakfast, Lunch, Dinner)
    let subtitle: String         // Meal description
    let kcal: Int                // Calories for the meal
    let imageName: String        // Asset name for meal image
    let ingredients: [String]    // List of ingredients used

    // MARK: - Sample Meals
    // Static sample data for previews and testing
    static let sample: [Meal] = [
        Meal(
            title: "Breakfast",
            subtitle: "Fruit Smoothie Bowl",
            kcal: 320,
            imageName: "meal_smoothie_bowl",
            ingredients: ["Strawberry", "Blueberry", "Kiwi", "Yogurt", "Granola"]
        ),
        Meal(
            title: "Lunch",
            subtitle: "Tropical Fruit Salad",
            kcal: 450,
            imageName: "meal_fruit_salad",
            ingredients: ["Mango", "Pineapple", "Kiwi", "Mint", "Lime"]
        ),
        Meal(
            title: "Dinner",
            subtitle: "Berry Yogurt Bowl",
            kcal: 280,
            imageName: "meal_yogurt_bowl",
            ingredients: ["Blueberry", "Strawberry", "Yogurt", "Honey"]
        )
    ]
}
