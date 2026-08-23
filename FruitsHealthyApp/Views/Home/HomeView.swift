//
//  HomeView.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 21/08/2026.
//

import SwiftUI

// MARK: - Home View
// Dashboard screen showing greeting, search, nutrition, and top fruits
struct HomeView: View {
    @StateObject private var vm = HomeViewModel()   // ViewModel for state management
    @EnvironmentObject var router: AppRouter        // Router for navigation

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                header
                searchBar
                goalCard

                sectionHeader("Nutrition Overview") { router.goToTab(.stats) }
                nutritionGrid

                sectionHeader("Top Fruits") { router.goToTab(.fruits) }
                topFruitsRow
            }
            .padding(16)
        }
        .background(Color.appBackground.ignoresSafeArea())
    }

    // MARK: - Header
    // Greeting text and avatar
    private var header: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("Hello, \(vm.userName)!").font(.h1)
                Text("Good Morning").font(.captionText).foregroundColor(.appTextGray)
            }
            Spacer()
            Image("avatar_olivia")
                .resizable()
                .scaledToFill()
                .frame(width: 44, height: 44)
                .clipShape(Circle())
        }
    }

    // MARK: - Search Bar
    // Search input for fruits and recipes
    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass").foregroundColor(.appTextGray)
            TextField("Search fruits, recipes...", text: $vm.searchText)
                .font(.bodyText)
        }
        .padding(12)
        .background(Color.appCard)
        .cornerRadius(14)
    }

    // MARK: - Goal Card
    // Displays daily kcal goal and progress
    private var goalCard: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text("Today's Goal").font(.captionText).foregroundColor(.appTextGray)
                Text("\(vm.nutrition.goalKcal) kcal").font(.h2)
                ProgressView(value: vm.nutrition.progress)
                    .tint(.appGreen)
                    .frame(width: 140)
            }
            Spacer()
            ZStack {
                Circle().stroke(Color.appGreen.opacity(0.2), lineWidth: 6)
                Circle()
                    .trim(from: 0, to: vm.nutrition.progress)
                    .stroke(Color.appGreen, style: StrokeStyle(lineWidth: 6, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                Text("\(Int(vm.nutrition.progress * 100))%").font(.captionText.bold())
            }
            .frame(width: 54, height: 54)
        }
        .padding(16)
        .background(Color.appCard)
        .cornerRadius(16)
    }

    // MARK: - Section Header
    // Reusable section header with "See All" button
    private func sectionHeader(_ title: String, action: @escaping () -> Void) -> some View {
        HStack {
            Text(title).font(.h2)
            Spacer()
            Button("See All", action: action)
                .font(.captionText)
                .foregroundColor(.appGreen)
        }
    }

    // MARK: - Nutrition Grid
    // Displays nutrient stats in grid layout
    private var nutritionGrid: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
            NutrientStatCard(icon: "flame.fill", iconColor: .appCoral, label: "Calories", value: "\(vm.nutrition.totalKcal) kcal")
            NutrientStatCard(icon: "leaf.fill", iconColor: .appGreen, label: "Carbs", value: "\(vm.nutrition.carbs.grams) g")
            NutrientStatCard(icon: "drop.fill", iconColor: .appBlue, label: "Protein", value: "\(vm.nutrition.protein.grams) g")
            NutrientStatCard(icon: "circle.fill", iconColor: .appYellow, label: "Fats", value: "\(vm.nutrition.fats.grams) g")
        }
    }

    // MARK: - Top Fruits Row
    // Displays top fruits horizontally
    private var topFruitsRow: some View {
        HStack(spacing: 12) {
            ForEach(vm.topFruits) { fruit in
                VStack(spacing: 6) {
                    Image(fruit.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                        .clipShape(Circle())
                    Text(fruit.name).font(.captionText.bold())
                    Text("\(fruit.kcal) kcal").font(.caption2).foregroundColor(.appTextGray)
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
}
