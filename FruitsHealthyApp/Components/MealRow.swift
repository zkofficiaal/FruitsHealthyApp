//
//  MealRow.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 21/08/2026.
//

import SwiftUI

// MARK: - Meal Row
// Displays meal info with image, details, kcal, and add button
struct MealRow: View {
    let meal: Meal              // Meal model data
    var onAdd: () -> Void       // Action when add button tapped

    var body: some View {
        HStack(spacing: 12) {
            Image(meal.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(alignment: .leading, spacing: 2) {
                Text(meal.title)
                    .font(.captionText)
                    .foregroundColor(.appTextGray)
                Text(meal.subtitle)
                    .font(.bodyText.bold())
                    .foregroundColor(.appTextDark)
                Text("\(meal.kcal) kcal")
                    .font(.captionText)
                    .foregroundColor(.appGreen)
            }

            Spacer()

            Button(action: onAdd) {
                Image(systemName: "plus")
                    .font(.caption.bold())
                    .foregroundColor(.white)
                    .frame(width: 22, height: 22)
                    .background(Color.appGreen)
                    .clipShape(Circle())
            }
        }
        .padding(12)
        .background(Color.appCard)
        .cornerRadius(14)
    }
}
