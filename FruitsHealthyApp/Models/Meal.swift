//
//  Meal.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 21/08/2026.
//

import Foundation

// MARK: - Meal Model
struct Meal: Identifiable, Equatable {
    let id = UUID()                 // Unique identifier for each meal
    let title: String               // Meal type (Breakfast, Lunch, Dinner)
    let subtitle: String            // Meal description
    let kcal: Int                   // Calories for the meal
    let imageName: String           // Asset name for meal image

    // MARK: - Sample Meals
    static let sample: [Meal] = [
        Meal(title: "Breakfast", subtitle: "Fruit Smoothie Bowl", kcal: 320, imageName: "meal_smoothie_bowl"),
        Meal(title: "Lunch", subtitle: "Tropical Fruit Salad", kcal: 450, imageName: "meal_fruit_salad"),
        Meal(title: "Dinner", subtitle: "Berry Yogurt Bowl", kcal: 280, imageName: "meal_yogurt_bowl")
    ]
}
