//
//  FruitDetailView.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 27/08/2026.
//

import SwiftUI

// MARK: - Fruit Detail View
// Displays detailed information about a fruit, with macros, servings, and add-to-today action
struct FruitDetailView: View {
    let fruit: Fruit
    @EnvironmentObject var store: NutritionStore
    @Environment(\.dismiss) private var dismiss
    @State private var servings = 1
    @State private var showAddedBanner = false

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // MARK: - Fruit Image
                Image(fruit.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 180)

                // MARK: - Header (Name + Favorite)
                HStack {
                    Text(fruit.name).font(.h1)
                    Spacer()
                    Button {
                        store.toggleFavorite(fruit)
                    } label: {
                        Image(systemName: store.isFavorite(fruit) ? "heart.fill" : "heart")
                            .foregroundColor(store.isFavorite(fruit) ? .appCoral : .appTextGray)
                            .font(.system(size: 22))
                    }
                }

                // MARK: - Calories
                Text("\(fruit.kcal) kcal per serving")
                    .font(.bodyText)
                    .foregroundColor(.appTextGray)
                    .frame(maxWidth: .infinity, alignment: .leading)

                // MARK: - Macros
                VStack(spacing: 10) {
                    macroRow("Carbs", "\(fruit.carbsG) g")
                    macroRow("Protein", "\(fruit.proteinG) g")
                    macroRow("Fat", "\(fruit.fatG) g")
                    macroRow("Fiber", "\(fruit.fiberG) g")
                }
                .padding()
                .background(Color.appCard)
                .cornerRadius(16)

                // MARK: - Serving Stepper
                ServingStepper(servings: $servings)

                // MARK: - Add Button
                PrimaryButton(title: "Add to Today", icon: "plus") {
                    store.addFruit(fruit, servings: servings)
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

    // MARK: - Macro Row
    private func macroRow(_ label: String, _ value: String) -> some View {
        HStack {
            Text(label).font(.bodyText)
            Spacer()
            Text(value).font(.bodyText.bold())
        }
    }
}
