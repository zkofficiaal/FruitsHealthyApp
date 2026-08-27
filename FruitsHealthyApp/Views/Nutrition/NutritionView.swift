import SwiftUI

// MARK: - Nutrition View
// Displays daily nutrition breakdown, donut chart, and water intake tracking
struct NutritionView: View {
    @EnvironmentObject var store: NutritionStore

    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(spacing: 20) {
                    // MARK: - Date Card
                    HStack {
                        Text(Date(), style: .date).font(.bodyText)
                        Spacer()
                        Image(systemName: "calendar")
                    }
                    .padding(12)
                    .background(Color.appCard)
                    .cornerRadius(12)

                    // MARK: - Nutrition Breakdown
                    if store.hasLoggedToday {
                        DonutProgressRing(
                            segments: store.nutrientBreakdown,
                            centerValue: "\(store.consumedKcal)",
                            centerLabel: "kcal",
                            size: geo.size.width * 0.42
                        )
                        .frame(maxWidth: .infinity)

                        VStack(spacing: 10) {
                            ForEach(store.nutrientBreakdown) { nutrientLegendRow($0) }
                        }
                        .padding()
                        .background(Color.appCard)
                        .cornerRadius(16)
                    } else {
                        EmptyStateView(
                            icon: "chart.pie",
                            title: "Nothing logged yet",
                            subtitle: "Add a fruit or meal to see your nutrition breakdown here."
                        )
                    }

                    // MARK: - Water Intake
                    waterIntakeCard
                }
                .padding(.horizontal, geo.size.width * 0.045)
                .padding(.vertical, 16)
                .frame(minWidth: geo.size.width)
            }
        }
        .navigationTitle("Nutrition")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.appBackground.ignoresSafeArea())
    }

    // MARK: - Nutrient Legend Row
    private func nutrientLegendRow(_ nutrient: NutrientBreakdown) -> some View {
        HStack {
            Circle()
                .fill(Color(hex: nutrient.colorHex))
                .frame(width: 10, height: 10)
            Text(nutrient.label).font(.captionText)
            Spacer()
            Text("\(nutrient.grams)g").font(.captionText.bold())
            Text("\(nutrient.percent)%")
                .font(.captionText)
                .foregroundColor(.appTextGray)
        }
    }

    // MARK: - Water Intake Card
    private var waterIntakeCard: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Water Intake").font(.bodyText.bold())
                Text("\(store.waterGlasses) / \(store.waterGoal) Glasses")
                    .font(.captionText)
                    .foregroundColor(.appTextGray)
                ProgressView(value: store.waterProgress)
                    .tint(.appBlue)
            }
            Spacer()
            VStack(spacing: 8) {
                // Add water
                Button { store.addWaterGlass() } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30)
                        .background(Color.appBlue)
                        .clipShape(Circle())
                }
                // Remove water
                Button { store.removeWaterGlass() } label: {
                    Image(systemName: "minus")
                        .foregroundColor(.appBlue)
                        .frame(width: 30, height: 30)
                        .background(Color.appBlue.opacity(0.15))
                        .clipShape(Circle())
                }
            }
        }
        .padding(16)
        .background(Color.appCard)
        .cornerRadius(16)
    }
}
