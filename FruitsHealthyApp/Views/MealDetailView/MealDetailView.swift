
import SwiftUI

// MARK: - Meal Detail View
// Displays detailed information about a meal, including kcal, ingredients, and add-to-today action
struct MealDetailView: View {
    let meal: Meal
    @EnvironmentObject var store: NutritionStore
    @State private var showAddedBanner = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // MARK: - Meal Image
                Image(meal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 180)
                    .frame(maxWidth: .infinity)

                // MARK: - Title & Calories
                Text(meal.subtitle).font(.h1)
                Text("\(meal.kcal) kcal")
                    .font(.bodyText)
                    .foregroundColor(.appTextGray)

                // MARK: - Ingredients
                Text("Ingredients").font(.h2)
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(meal.ingredients, id: \.self) { ingredient in
                        HStack {
                            Circle()
                                .fill(Color.appGreen)
                                .frame(width: 6, height: 6)
                            Text(ingredient).font(.bodyText)
                        }
                    }
                }
                .padding()
                .background(Color.appCard)
                .cornerRadius(16)
                .frame(maxWidth: .infinity, alignment: .leading)

                // MARK: - Add Button
                PrimaryButton(title: "Add to Today", icon: "plus") {
                    store.addMeal(meal)
                    withAnimation { showAddedBanner = true }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.4) {
                        withAnimation { showAddedBanner = false }
                    }
                }
            }
            .padding(20)
        }
        // MARK: - Added Banner Overlay
        .overlay(alignment: .top) {
            if showAddedBanner {
                Text("Added to Today ✓")
                    .font(.captionText.bold())
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(Color.appGreen)
                    .cornerRadius(20)
                    .padding(.top, 8)
                    .transition(.move(edge: .top).combined(with: .opacity))
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.appBackground.ignoresSafeArea())
    }
}
