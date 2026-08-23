import Foundation
import Combine

// MARK: - Fruits ViewModel
// Handles fruit categories, filtering, and quick-add actions
final class FruitsViewModel: ObservableObject {
    @Published var categories = FruitCategory.all
    @Published var selectedCategory: String = "All"
    @Published var allFruits = Fruit.sample
    @Published var addedFruitIDs: Set<UUID> = []   // Track added fruits by ID

    // MARK: - Filtered Fruits
    var filteredFruits: [Fruit] {
        selectedCategory == "All"
            ? allFruits
            : allFruits.filter { $0.category == selectedCategory }
    }

    // MARK: - Add Fruit
    func addFruit(_ fruit: Fruit) {
        addedFruitIDs.insert(fruit.id)
        // Hook point for persistence, cart, or nutrition tracking logic later
    }

    // MARK: - Check if Fruit Added
    func isFruitAdded(_ fruit: Fruit) -> Bool {
        addedFruitIDs.contains(fruit.id)
    }

    // MARK: - Remove Fruit
    func removeFruit(_ fruit: Fruit) {
        addedFruitIDs.remove(fruit.id)
    }
}
