import SwiftUI

// MARK: - Meal Plan View
// Screen for managing daily meals, kcal progress, and recommendations
struct MealPlanView: View {
    @StateObject private var vm = MealPlanViewModel()
    @EnvironmentObject var router: AppRouter   // Router for navigation

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // MARK: - Header
                HStack {
                    // Back button → returns to Home
                    Button { router.goBackToHome() } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.appTextDark)
                    }

                    Spacer()

                    Text("Meal Plan").font(.h2)

                    Spacer()

                    // Ellipsis button → placeholder for future actions
                    Button {
                        // TODO: Wire to options sheet or menu
                    } label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.appTextDark)
                    }
                }

                // MARK: - Date Card
                HStack {
                    Text(vm.selectedDate).font(.bodyText)
                    Spacer()
                    Button {
                        // TODO: Wire to calendar picker
                    } label: {
                        Image(systemName: "calendar")
                            .foregroundColor(.appTextDark)
                    }
                }
                .padding(12)
                .background(Color.appCard)
                .cornerRadius(12)

                Text("Recommended Meals").font(.h2)

                // MARK: - Meals List
                VStack(spacing: 10) {
                    ForEach(vm.meals) { meal in
                        MealRow(meal: meal) {
                            vm.logMeal(meal)   // "+" button now logs meal
                        }
                    }
                }

                // MARK: - Daily Progress Card
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Daily Progress").font(.bodyText.bold())
                        Spacer()
                        Text("\(vm.currentKcal) / \(vm.goalKcal) kcal")
                            .font(.captionText)
                            .foregroundColor(.appTextGray)
                    }
                    ProgressView(value: Double(vm.currentKcal), total: Double(vm.goalKcal))
                        .tint(.appGreen)
                    Text("\(vm.progressPercent)%")
                        .font(.captionText)
                        .foregroundColor(.appGreen)
                }
                .padding(16)
                .background(Color.appCard)
                .cornerRadius(16)
            }
            .padding(16)
        }
        .background(Color.appBackground.ignoresSafeArea())
    }
}
