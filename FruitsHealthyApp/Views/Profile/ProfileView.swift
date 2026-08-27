//
//  ProfileView.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 27/08/2026.
//

import SwiftUI

// MARK: - Profile View
// Displays user profile info including avatar, name, goals, and favorites
struct ProfileView: View {
    @EnvironmentObject var store: NutritionStore

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // MARK: - Avatar & Name
                VStack(spacing: 10) {
                    Image("avatar_olivia")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                    Text(store.userName).font(.h1)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 20)

                // MARK: - Profile Stats
                VStack(spacing: 0) {
                    profileRow(label: "Daily Calorie Goal", value: "\(store.calorieGoal) kcal")
                    Divider()
                    profileRow(label: "Water Goal", value: "\(store.waterGoal) glasses")
                    Divider()
                    profileRow(label: "Favorites", value: "\(store.favoriteFruitIDs.count)")
                }
                .background(Color.appCard)
                .cornerRadius(16)

                Spacer()
            }
            .padding(20)
        }
        .navigationTitle("Profile")
        .background(Color.appBackground.ignoresSafeArea())
    }

    // MARK: - Profile Row
    private func profileRow(label: String, value: String) -> some View {
        HStack {
            Text(label).font(.bodyText)
            Spacer()
            Text(value)
                .font(.bodyText.bold())
                .foregroundColor(.appTextGray)
        }
        .padding(16)
    }
}
