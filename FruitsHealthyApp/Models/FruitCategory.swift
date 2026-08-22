//
//  FruitCategory.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 21/08/2026.
//

import Foundation

// MARK: - Fruit Category Model
struct FruitCategory: Identifiable, Equatable {
    let id = UUID()          // Unique identifier for each category
    let title: String        // Category title (e.g., All, Berry, Tropical, Citrus)

    // MARK: - Sample Categories
    static let all: [FruitCategory] = [
        .init(title: "All"),       // All fruits
        .init(title: "Berry"),     // Berry fruits
        .init(title: "Tropical"),  // Tropical fruits
        .init(title: "Citrus")     // Citrus fruits
    ]
}
