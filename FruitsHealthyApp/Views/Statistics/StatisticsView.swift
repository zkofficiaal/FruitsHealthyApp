import SwiftUI
import Charts

// MARK: - Statistics View
// Displays calorie intake chart and nutrient ratio breakdown
struct StatisticsView: View {
    @EnvironmentObject var store: NutritionStore
    @State private var selectedRange: StatsRange = .day

    // MARK: - Range Enum
    enum StatsRange: String, CaseIterable {
        case day = "Day", week = "Week", month = "Month", year = "Year"
    }

    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ScrollView {
                    VStack(spacing: 20) {
                        // MARK: - Header
                        Text("Statistics")
                            .font(.h1)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        // MARK: - Range Selector
                        rangeSelector

                        // MARK: - Calorie Intake Card
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Calorie Intake")
                                .font(.captionText)
                                .foregroundColor(.appTextGray)
                            Text("\(store.weeklyEntries.reduce(0) { $0 + $1.kcal }) kcal")
                                .font(.h1)
                            Text("This Week")
                                .font(.captionText)
                                .foregroundColor(.appTextGray)

                            Chart(store.weeklyEntries) { entry in
                                BarMark(
                                    x: .value("Day", entry.day),
                                    y: .value("Kcal", entry.kcal)
                                )
                                .foregroundStyle(entry.day == "Sun"
                                                 ? Color.appGreen
                                                 : Color.appGreen.opacity(0.3))
                                .cornerRadius(6)
                            }
                            .frame(height: geo.size.height * 0.2)
                        }
                        .padding(16)
                        .background(Color.appCard)
                        .cornerRadius(16)

                        // MARK: - Nutrients Ratio Card
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Nutrients Ratio").font(.h2)
                            Text("Today")
                                .font(.captionText)
                                .foregroundColor(.appTextGray)

                            if store.hasLoggedToday {
                                HStack {
                                    DonutProgressRing(
                                        segments: store.nutrientBreakdown,
                                        centerValue: "",
                                        centerLabel: "",
                                        size: geo.size.width * 0.3
                                    )
                                    VStack(alignment: .leading, spacing: 8) {
                                        ForEach(store.nutrientBreakdown) { n in
                                            HStack {
                                                Circle()
                                                    .fill(Color(hex: n.colorHex))
                                                    .frame(width: 8, height: 8)
                                                Text(n.label).font(.captionText)
                                                Spacer()
                                                Text("\(n.percent)%")
                                                    .font(.captionText.bold())
                                            }
                                        }
                                    }
                                }
                            } else {
                                Text("Log something today to see your ratio.")
                                    .font(.captionText)
                                    .foregroundColor(.appTextGray)
                            }
                        }
                        .padding(16)
                        .background(Color.appCard)
                        .cornerRadius(16)
                    }
                    .padding(.horizontal, geo.size.width * 0.045)
                    .padding(.vertical, 16)
                    .frame(minWidth: geo.size.width)
                }
            }
            .background(Color.appBackground.ignoresSafeArea())
        }
    }

    // MARK: - Range Selector
    private var rangeSelector: some View {
        HStack {
            ForEach(StatsRange.allCases, id: \.self) { range in
                Text(range.rawValue)
                    .font(.captionText.bold())
                    .foregroundColor(selectedRange == range ? .white : .appTextGray)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
