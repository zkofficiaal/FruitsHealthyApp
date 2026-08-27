import Foundation

// MARK: - Fruit Category Model
// Represents a category of fruits (e.g., Berry, Tropical, Citrus)
struct FruitCategory: Identifiable, Equatable {
    let id = UUID()        // Unique identifier
    let title: String      // Category title

    // MARK: - All Categories
    // Static list of categories used throughout the app
    static let all: [FruitCategory] = [
        .init(title: "All"),
        .init(title: "Berry"),
        .init(title: "Tropical"),
        .init(title: "Citrus")
    ]
}
