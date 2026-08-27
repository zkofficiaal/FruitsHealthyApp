import SwiftUI

// MARK: - Meal Plan View
// Displays daily meal plan with recommended meals and kcal progress
struct MealPlanView: View {
    @EnvironmentObject var store: NutritionStore
    let meals = Meal.sample   // Sample meals for display

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // MARK: - Header
                Text("Meal Plan").font(.h1)

                // MARK: - Date Card
                HStack {
                    Text(Date(), style: .date).font(.bodyText)
                    Spacer()
                    Image(systemName: "calendar")
                }
                .padding(12)
                .background(Color.appCard)
                .cornerRadius(12)

                // MARK: - Recommended Meals
                Text("Recommended Meals").font(.h2)

                VStack(spacing: 10) {
                    ForEach(meals) { meal in
                        NavigationLink { MealDetailView(meal: meal) } label: {
                            MealRow(meal: meal) {
                                store.addMeal(meal)
                            }
                        }
                        .buttonStyle(.plain)
                    }
                }

                // MARK: - Daily Progress Card
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Daily Progress").font(.bodyText.bold())
                        Spacer()
                        Text("\(store.consumedKcal) / \(store.calorieGoal) kcal")
                            .font(.captionText)
                            .foregroundColor(.appTextGray)
                    }
                    ProgressView(value: store.progress)
                        .tint(.appGreen)
                    Text("\(Int(store.progress * 100))%")
                        .font(.captionText)
                        .foregroundColor(.appGreen)
                }
                .padding(16)
                .background(Color.appCard)
                .cornerRadius(16)
            }
            .padding(16)
        }
        .navigationTitle("Meal Plan")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.appBackground.ignoresSafeArea())
    }
}
