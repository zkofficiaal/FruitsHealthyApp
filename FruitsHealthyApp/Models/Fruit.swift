import Foundation

// MARK: - Fruit Model
// Represents a fruit with nutritional values and category
struct Fruit: Identifiable, Equatable, Hashable {
    let id = UUID()              // Unique identifier
    let name: String             // Fruit name
    let imageName: String        // Asset image name
    let kcal: Int                // Calories per serving
    let carbsG: Int              // Carbohydrates (grams)
    let proteinG: Int            // Protein (grams)
    let fatG: Int                // Fat (grams)
    let fiberG: Int              // Fiber (grams)
    let category: String         // Category (e.g., Citrus, Berry, Tropical)

    // MARK: - Sample Data
    // Static sample fruits for previews and testing
    static let sample: [Fruit] = [
        Fruit(name: "Orange", imageName: "fruit_orange", kcal: 47, carbsG: 12, proteinG: 1, fatG: 0, fiberG: 2, category: "Citrus"),
        Fruit(name: "Strawberry", imageName: "fruit_strawberry", kcal: 32, carbsG: 8, proteinG: 1, fatG: 0, fiberG: 2, category: "Berry"),
        Fruit(name: "Kiwi", imageName: "fruit_kiwi", kcal: 42, carbsG: 10, proteinG: 1, fatG: 0, fiberG: 2, category: "Tropical"),
        Fruit(name: "Mango", imageName: "fruit_mango", kcal: 60, carbsG: 15, proteinG: 1, fatG: 0, fiberG: 2, category: "Tropical"),
        Fruit(name: "Grapes", imageName: "fruit_grapes", kcal: 69, carbsG: 18, proteinG: 1, fatG: 0, fiberG: 1, category: "Berry"),
        Fruit(name: "Pineapple", imageName: "fruit_pineapple", kcal: 82, carbsG: 22, proteinG: 1, fatG: 0, fiberG: 2, category: "Tropical"),
        Fruit(name: "Blueberry", imageName: "fruit_blueberry", kcal: 28, carbsG: 7, proteinG: 0, fatG: 0, fiberG: 1, category: "Berry"),
        Fruit(name: "Lemon", imageName: "fruit_lemon", kcal: 29, carbsG: 9, proteinG: 1, fatG: 0, fiberG: 3, category: "Citrus"),
        Fruit(name: "Grapefruit", imageName: "fruit_grapefruit", kcal: 42, carbsG: 11, proteinG: 1, fatG: 0, fiberG: 2, category: "Citrus"),
        Fruit(name: "Apple", imageName: "fruit
