//
//  SearchView.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 27/08/2026.
//

import SwiftUI

// MARK: - Search View
// Provides search functionality for fruits and meals
struct SearchView: View {
    @State private var query = ""                  // Search query text
    @Environment(\.dismiss) private var dismiss    // Dismiss sheet action

    // MARK: - Matching Results
    private var matchingFruits: [Fruit] {
        query.isEmpty ? [] :
        Fruit.sample.filter { $0.name.localizedCaseInsensitiveContains(query) }
    }
    private var matchingMeals: [Meal] {
        query.isEmpty ? [] :
        Meal.sample.filter { $0.subtitle.localizedCaseInsensitiveContains(query) }
    }

    var body: some View {
        NavigationStack {
            VStack {
                // MARK: - Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.appTextGray)
                    TextField("Search fruits, recipes...", text: $query)
                    if !query.isEmpty {
                        Button { query = "" } label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.appTextGray)
                        }
                    }
                }
                .padding(12)
                .background(Color.appCard)
                .cornerRadius(14)
                .padding()

                // MARK: - Results / Empty States
                if query.isEmpty {
                    EmptyStateView(
                        icon: "magnifyingglass",
                        title: "Search fruits & recipes",
                        subtitle: "Try “mango” or “smoothie”"
                    )
                    Spacer()
                } else if matchingFruits.isEmpty && matchingMeals.isEmpty {
                    EmptyStateView(
                        icon: "questionmark.circle",
                        title: "No results",
                        subtitle: "Try a different search term"
                    )
                    Spacer()
                } else {
                    List {
                        // Fruits section
                        if !matchingFruits.isEmpty {
                            Section("Fruits") {
                                ForEach(matchingFruits) { fruit in
                                    NavigationLink { FruitDetailView(fruit: fruit) } label: {
                                        Text(fruit.name)
                                    }
                                }
                            }
                        }
                        // Meals section
                        if !matchingMeals.isEmpty {
                            Section("Meals") {
                                ForEach(matchingMeals) { meal in
                                    NavigationLink { MealDetailView(meal: meal) } label: {
                                        Text(meal.subtitle)
                                    }
                                }
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            // MARK: - Navigation
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") { dismiss() }
                }
            }
        }
    }
}
