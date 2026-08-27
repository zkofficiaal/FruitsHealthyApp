import SwiftUI

// MARK: - Fruits View
// Screen for browsing fruits with category filter and grid layout
struct FruitsView: View {
    @EnvironmentObject var store: NutritionStore   // Centralized nutrition store
    @State private var selectedCategory: String = "All" // Currently selected category
    let categories = FruitCategory.all             // Available categories

    // MARK: - Filtered Fruits
    private var filteredFruits: [Fruit] {
        selectedCategory == "All"
            ? Fruit.sample
            : Fruit.sample.filter { $0.category == selectedCategory }
    }

    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                VStack(alignment: .leading, spacing: 16) {
                    // MARK: - Header
                    Text("Fruits")
                        .font(.h1)

                    // MARK: - Category Pills
                    HStack(spacing: 10) {
                        ForEach(categories) { cat in
                            CategoryPill(
                                title: cat.title,
                                isSelected: selectedCategory == cat.title
                            ) {
                                selectedCategory = cat.title
                            }
                        }
                    }

                    // MARK: - Fruits Grid
                    ScrollView {
                        LazyVGrid(
                            columns: [GridItem(.flexible()), GridItem(.flexible())],
                            spacing: 12
                        ) {
                            ForEach(filteredFruits) { fruit in
                                FruitGridCard(fruit: fruit) {
                                    store.addFruit(fruit, servings: 1)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, geo.size.width * 0.045)
                .padding(.top, 16)
                .frame(width: geo.size.width, height: geo.size.height)
            }
            .background(Color.appBackground.ignoresSafeArea())
            .navigationDestination(for: Fruit.self) { FruitDetailView(fruit: $0) }
        }
    }
}
