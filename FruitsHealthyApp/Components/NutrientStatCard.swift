//
//  NutrientStatCard.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 21/08/2026.
//

import SwiftUI

// MARK: - Nutrient Stat Card
// Displays nutrient info with icon, label, and value
struct NutrientStatCard: View {
    let icon: String              // SF Symbol icon name
    let iconColor: Color          // Icon color
    let label: String             // Nutrient label (e.g., Carbs, Protein)
    let value: String             // Nutrient value (e.g., "75g")

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundColor(iconColor)
                .frame(width: 30, height: 30)
                .background(iconColor.opacity(0.15))
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 2) {
                Text(label)
                    .font(.captionText)
                    .foregroundColor(.appTextGray)
                Text(value)
                    .font(.bodyText.bold())
                    .foregroundColor(.appTextDark)
            }
            Spacer()
        }
        .padding(12)
        .background(Color.appCard)
        .cornerRadius(14)
    }
}
