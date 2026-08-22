//
//  FruitGridCard.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 21/08/2026.
//
import SwiftUI

// MARK: - Fruit Grid Card
// Displays fruit info with image, kcal, and add button
struct FruitGridCard: View {
    let fruit: Fruit              // Fruit model data
    var onAdd: () -> Void         // Action when add button tapped

    var body: some View {
        HStack(spacing: 12) {
            Image(fruit.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 44, height: 44)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 2) {
                Text(fruit.name)
                    .font(.bodyText.bold())
                    .foregroundColor(.appTextDark)
                Text("\(fruit.kcal) kcal")
                    .font(.captionText)
                    .foregroundColor(.appTextGray)
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
        .shadow(color: .black.opacity(0.04), radius: 5, y: 2)
    }
}

