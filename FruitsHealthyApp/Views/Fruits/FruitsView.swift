import SwiftUI

// MARK: - Fruits View
// Screen for browsing fruits with category filter, back navigation, and add action
struct FruitsView: View {
    @StateObject private var vm = FruitsViewModel()   // ViewModel for fruits state
    @EnvironmentObject var router: AppRouter          // Router for navigation

    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading, spacing: 16) {
                // MARK: - Header
                HStack {
                    // Back button → returns to Home
                    Button {
                        router.goBackToHome()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.appTextDark)
                    }

                    Spacer()

                    Text("Fruits").font(.h2)

                    Spacer()

                    // Filter button → placeholder for future sheet
                    Button {
                        // TODO: Wire to filter sheet or modal
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .foregroundColor(.appTextDark)
                    }
                }

                // MARK: - Category Pills
                HStack(spacing: 10) {
                    ForEach(vm.categories) { cat in
                        CategoryPill(
                            title: cat.title,
                            isSelected: vm.selectedCategory == cat.title
                        ) {
                            vm.selectedCategory = cat.title
                        }
                    }
                }

                // MARK: - Fruits Grid
                ScrollView {
                    LazyVGrid(
                        columns: [GridItem(.flexible()), GridItem(.flexible())],
                        spacing: 12
                    ) {
                        ForEach(vm.filteredFruits) { fruit in
                            FruitGridCard(fruit: fruit) {
                                vm.addFruit(fruit)   // Quick add action
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, geo.size.width * 0.045)
            .padding(.vertical, 16)
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .background(Color.appBackground.ignoresSafeArea())
    }
}
