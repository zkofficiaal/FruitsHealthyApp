//
//  HomeView.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 21/08/2026.
//

import SwiftUI

import SwiftUI

// MARK: - Home View
// Main dashboard showing profile, goals, nutrition overview, meal plan, and top fruits
struct HomeView: View {
    @EnvironmentObject var store: NutritionStore   // Centralized nutrition store
    @State private var showSearch = false          // Controls search sheet presentation

    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        header
                        searchBar
                        goalCard

                        // MARK: - Nutrition Overview
                        HStack {
                            Text("Nutrition Overview").font(.h2)
                            Spacer()
                            NavigationLink("See All") { NutritionView() }
                                .font(.captionText)
                                .foregroundColor(.appGreen)
                        }
                        nutritionGrid

                        // MARK: - Meal Plan
                        NavigationLink { MealPlanView() } label: {
                            HStack {
                                Image(systemName: "fork.knife.circle.fill")
                                    .foregroundColor(.appCoral)
                                Text("Today's Meal Plan")
                                    .font(.bodyText.bold())
                                    .foregroundColor(.appTextDark)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.appTextGray)
                            }
                            .padding(16)
                            .background(Color.appCard)
                            .cornerRadius(16)
                        }

                        // MARK: - Top Fruits
                        HStack {
                            Text("Top Fruits").font(.h2)
                            Spacer()
                            NavigationLink("See All") { FruitsView() }
                                .font(.captionText)
                                .foregroundColor(.appGreen)
                        }
                        topFruitsRow(geo: geo)
                    }
                    .padding(.horizontal, geo.size.width * 0.045)
                    .padding(.vertical, 16)
                    .frame(minWidth: geo.size.width)
                }
            }
            .background(Color.appBackground.ignoresSafeArea())
            .navigationDestination(for: Fruit.self) { FruitDetailView(fruit: $0) }
            .sheet(isPresented: $showSearch) { SearchView() }
        }
    }

    // MARK: - Header
    private var header: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("Hello, \(store.userName)!").font(.h1)
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
    private var searchBar: some View {
        Button { showSearch = true } label: {
            HStack {
                Image(systemName: "magnifyingglass").foregroundColor(.appTextGray)
                Text("Search fruits, recipes...")
                    .font(.bodyText)
                    .foregroundColor(.appTextGray)
                Spacer()
            }
            .padding(12)
            .background(Color.appCard)
            .cornerRadius(14)
        }
    }

    // MARK: - Goal Card
    private var goalCard: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text("Today's Goal").font(.captionText).foregroundColor(.appTextGray)
                Text("\(store.calorieGoal) kcal").font(.h2)
                ProgressView(value: store.progress)
                    .tint(.appGreen)
                    .frame(maxWidth: 140)
            }
            Spacer()
            ZStack {
                Circle().stroke(Color.appGreen.opacity(0.2), lineWidth: 6)
                Circle()
                    .trim(from: 0, to: store.progress)
                    .stroke(Color.appGreen, style: StrokeStyle(lineWidth: 6, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                Text("\(Int(store.progress * 100))%").font(.captionText.bold())
            }
            .frame(width: 54, height: 54)
        }
        .padding(16)
        .background(Color.appCard)
        .cornerRadius(16)
    }

    // MARK: - Nutrition Grid
    private var nutritionGrid: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
            NutrientStatCard(icon: "flame.fill", iconColor: .appCoral,
                             label: "Calories", value: "\(store.consumedKcal) kcal")
            NutrientStatCard(icon: "leaf.fill", iconColor: .appGreen,
                             label: "Carbs", value: "\(store.carbsGrams) g")
            NutrientStatCard(icon: "drop.fill", iconColor: .appBlue,
                             label: "Protein", value: "\(store.proteinGrams) g")
            NutrientStatCard(icon: "circle.fill", iconColor: .appYellow,
                             label: "Fats", value: "\(store.fatsGrams) g")
        }
    }

    // MARK: - Top Fruits Row
    private func topFruitsRow(geo: GeometryProxy) -> some View {
        HStack(spacing: 12) {
            ForEach(Array(Fruit.sample.prefix(4))) { fruit in
                NavigationLink(value: fruit) {
                    VStack(spacing: 6) {
                        Image(fruit.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: geo.size.width * 0.14,
                                   height: geo.size.width * 0.14)
                            .clipShape(Circle())
                        Text(fruit.name)
                            .font(.captionText.bold())
                            .foregroundColor(.appTextDark)
                        Text("\(fruit.kcal) kcal")
                            .font(.caption2)
                            .foregroundColor(.appTextGray)
                    }
                }
                .buttonStyle(.plain)
            }
        }
        .frame(maxWidth: .infinity)
    }
}
