//
//  StatisticsViewModel.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 21/08/2026.
//

import Foundation
import Combine

// MARK: - Statistics ViewModel
// Manages statistics data and selected range (day, week, month, year)
enum StatsRange: String, CaseIterable {
    case day = "Day", week = "Week", month = "Month", year = "Year"
}

final class StatisticsViewModel: ObservableObject {
    @Published var selectedRange: StatsRange = .day
    // Currently selected stats range

    @Published var data: StatisticsData = .sample
    // Holds statistics data (sample by default)
}
