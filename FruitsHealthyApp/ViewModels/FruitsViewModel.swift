//
//  FruitsViewModel.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 21/08/2026.
//

import Foundation
import Combine

// MARK: - Fruits ViewModel
final class FruitsViewModel: ObservableObject {
    @Published var categories = FruitCategory.all
    // All available fruit categories

    @Published var selectedCategory: String = "All"
    // Currently selected category (default: All)

    @Published var allFruits = Fruit.sample
    // Complete list of fruits (sample data)

    var filteredFruits: [Fruit] {
        selectedCategory == "All"
            ? allFruits
            : allFruits.filter { $0.category == selectedCategory }
        // Filters fruits based on selected category
    }
}
