//
//  HomeViewModel.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 21/08/2026.
//

import Foundation
import Combine

// MARK: - Home ViewModel
// Manages user greeting, search, and top fruits
final class HomeViewModel: ObservableObject {
    @Published var userName: String = "DevTechZahid"
    // Stores current user’s name for greeting

    @Published var searchText: String = ""
    // Tracks search input for filtering fruits

    @Published var nutrition: DailyNutrition = .sample
    // Holds daily nutrition data (sample by default)

    @Published var topFruits: [Fruit] = Array(Fruit.sample.prefix(4))
    // Displays top 4 fruits on home screen
}
