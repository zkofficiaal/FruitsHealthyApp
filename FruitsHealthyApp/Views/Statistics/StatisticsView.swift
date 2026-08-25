import SwiftUI
import Charts

// MARK: - Statistics View
// Screen for viewing calorie intake and nutrient ratio analytics
struct StatisticsView: View {
    @StateObject private var vm = StatisticsViewModel()
    @EnvironmentObject var router: AppRouter   // Router for navigation

    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(spacing: 20) {
                    // MARK: - Header
                    HStack {
                        Button { router.goBackToHome() } label: {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.appTextDark)
                        }

                        Spacer()

                        Text("Statistics").font(.h2)

                        Spacer()

                        Button {
                            // TODO: Wire to options sheet or menu
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(.appTextDark)
                        }
                    }

                    rangeSelector

                    // MARK: - Calorie Intake Card
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Calorie Intake").font(.captionText).foregroundColor(.appTextGray)
                        Text("\(vm.data.weekTotalKcal) kcal").font(.h1)
                        Text("This Week").font(.captionText).foregroundColor(.appTextGray)

                        Chart(vm.data.entries) { entry in
                            BarMark(
                                x: .value("Day", entry.day),
                                y: .value("Kcal", entry.kcal)
                            )
                            .foregroundStyle(entry.kcal == vm.data.highlightKcal
                                             ? Color.appGreen
                                             : Color.appGreen.opacity(0.25))
                            .cornerRadius(6)
                            .annotation(position: .top) {
                                if entry.kcal == vm.data.highlightKcal {
                                    Text("\(entry.kcal)")
                                        .font(.caption2.bold())
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(Color.appTextDark)
                                        .cornerRadius(8)
                                }
                            }
                        }
                        .frame(height: geo.size.height * 0.2) // responsive height
                    }
                    .padding(16)
                    .background(Color.appCard)
                    .cornerRadius(16)

                    // MARK: - Nutrients Ratio Card
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Nutrients Ratio").font(.h2)
                        Text("This Week").font(.captionText).foregroundColor(.appTextGray)

                        HStack {
                            DonutProgressRing(
                                segments: vm.data.nutrientRatio,
                                centerValue: "",
                                centerLabel: "",
                                size: geo.size.width * 0.3
                            )
                            .frame(width: geo.size.width * 0.3, height: geo.size.width * 0.3)

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
                .padding(.horizontal, geo.size.width * 0.045)
                .padding(.vertical, 16)
                .frame(minWidth: geo.size.width)
            }
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
