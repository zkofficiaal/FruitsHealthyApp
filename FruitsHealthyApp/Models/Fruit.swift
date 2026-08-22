//
//  Fruit.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 21/08/2026.
//

import Foundation

// MARK: - Fruit Model
struct Fruit: Identifiable, Equatable, Hashable {
    let id = UUID()                  // Unique identifier for each fruit
    let name: String                 // Fruit name
    let imageName: String            // Asset name for fruit image
    let kcal: Int                    // Calories per 100g
    let category: String             // Category (e.g., Citrus, Berry, Tropical)

    // MARK: - Sample Data
    static let sample: [Fruit] = [
        Fruit(name: "Orange", imageName: "fruit_orange", kcal: 47, category: "Citrus"),
        Fruit(name: "Strawberry", imageName: "fruit_strawberry", kcal: 32, category: "Berry"),
        Fruit(name: "Kiwi", imageName: "fruit_kiwi", kcal: 42, category: "Tropical"),
        Fruit(name: "Mango", imageName: "fruit_mango", kcal: 60, category: "Tropical"),
        Fruit(name: "Grapes", imageName: "fruit_grapes", kcal: 69, category: "Berry"),
        Fruit(name: "Pineapple", imageName: "fruit_pineapple", kcal: 82, category: "Tropical"),
        Fruit(name: "Blueberry", imageName: "fruit_blueberry", kcal: 28, category: "Berry"),
        Fruit(name: "Lemon", imageName: "fruit_lemon", kcal: 29, category: "Citrus"),
        Fruit(name: "Grapefruit", imageName: "fruit_grapefruit", kcal: 42, category: "Citrus"),
        Fruit(name: "Apple", imageName: "fruit_apple", kcal: 52, category: "Berry"),
        Fruit(name: "Watermelon", imageName: "fruit_watermelon", kcal: 30, category: "Tropical"),
        Fruit(name: "Pomegranate", imageName: "fruit_pomegranate", kcal: 83, category: "Berry")
    ]
}
