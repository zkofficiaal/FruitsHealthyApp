//
//  FruitsView.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 21/08/2026.
//

import SwiftUI

// MARK: - Fruits View
// Screen for browsing fruits with category filter and grid layout
struct FruitsView: View {
    @StateObject private var vm = FruitsViewModel()   // ViewModel for fruits state

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // MARK: - Header
            // Top bar with back, title, and filter icon
            HStack {
                Image(systemName: "chevron.left")
                Spacer()
                Text("Fruits").font(.h2)
                Spacer()
                Image(systemName: "line.3.horizontal.decrease.circle")
            }

            // MARK: - Category Pills
            // Horizontal list of category filters
            HStack(spacing: 10) {
                ForEach(vm.categories) { cat in
                    CategoryPill(title: cat.title, isSelected: vm.selectedCategory == cat.title) {
                        vm.selectedCategory = cat.title
                    }
                }
            }

            // MARK: - Fruits Grid
            // Scrollable grid of filtered fruits
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                    ForEach(vm.filteredFruits) { fruit in
                        FruitGridCard(fruit: fruit) { }
                    }
                }
            }
        }
        .padding(16)
        .background(Color.appBackground.ignoresSafeArea())
    }
}
