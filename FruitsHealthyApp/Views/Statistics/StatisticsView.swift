//
//  StatisticsView.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 21/08/2026.
//

import SwiftUI
import Charts   ///framework for statistics

// MARK: - Statistics View
// Screen for viewing calorie intake and nutrient ratio analytics
struct StatisticsView: View {
    @StateObject private var vm = StatisticsViewModel()   // ViewModel for statistics state

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // MARK: - Header
                // Top bar with back, title, and options
                HStack {
                    Image(systemName: "chevron.left")
                    Spacer()
                    Text("Statistics").font(.h2)
                    Spacer()
                    Image(systemName: "ellipsis")
                }

                // MARK: - Range Selector
                // Toggle between Day, Week, Month, Year
                rangeSelector

                // MARK: - Calorie Intake Card
                // Displays weekly kcal intake with bar chart
                VStack(alignment: .leading, spacing: 12) {
                    Text("Calorie Intake").font(.captionText).foregroundColor(.appTextGray)
                    Text("\(vm.data.weekTotalKcal) kcal").font(.h1)
                    Text("This Week").font(.captionText).foregroundColor(.appTextGray)

                    Chart(vm.data.entries) { entry in
                        BarMark(
                            x: .value("Day", entry.day),
                            y: .value("Kcal", entry.kcal)
                        )
                        .foregroundStyle(entry.kcal == vm.data.highlightKcal ? Color.appGreen : Color.appGreen.opacity(0.3))
                        .cornerRadius(6)
                    }
                    .frame(height: 160)
                }
                .padding(16)
                .background(Color.appCard)
                .cornerRadius(16)

                // MARK: - Nutrients Ratio Card
                // Donut chart with nutrient distribution
                VStack(alignment: .leading, spacing: 12) {
                    Text("Nutrients Ratio").font(.h2)
                    Text("This Week").font(.captionText).foregroundColor(.appTextGray)

                    HStack {
                        DonutProgressRing(
                            segments: vm.data.nutrientRatio,
                            centerValue: "",
                            centerLabel: ""
                        )
                        .frame(width: 110, height: 110)

                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(vm.data.nutrientRatio) { n in
                                HStack {
                                    Circle().fill(Color(hex: n.colorHex)).frame(width: 8, height: 8)
                                    Text(n.label).font(.captionText)
                                    Spacer()
                                    Text("\(n.percent)%").font(.captionText.bold())
                                }
                            }
                        }
                    }
                }
                .padding(16)
                .background(Color.appCard)
                .cornerRadius(16)
            }
            .padding(16)
        }
        .background(Color.appBackground.ignoresSafeArea())
    }

    // MARK: - Range Selector
    private var rangeSelector: some View {
        HStack {
            ForEach(StatsRange.allCases, id: \.self) { range in
                Text(range.rawValue)
                    .font(.captionText.bold())
                    .foregroundColor(vm.selectedRange == range ? .white : .appTextGray)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(vm.selectedRange == range ? Color.appGreen : Color.clear)
                    .cornerRadius(16)
                    .onTapGesture { vm.selectedRange = range }
            }
        }
        .padding(4)
        .background(Color.appCard)
        .cornerRadius(20)
    }
}
