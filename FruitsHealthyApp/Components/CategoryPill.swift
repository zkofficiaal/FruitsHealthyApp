//
//  CategoryPill.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 21/08/2026.
//

import SwiftUI

// MARK: - Category Pill
// Reusable pill-style button for category selection
struct CategoryPill: View {
    let title: String              // Category label text
    let isSelected: Bool           // Selection state
    let action: () -> Void         // Action closure

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.captionText.bold())
                .foregroundColor(isSelected ? .white : .appTextGray)
                .padding(.horizontal, 18)
                .padding(.vertical, 8)
                .background(isSelected ? Color.appGreen : Color.appCard)
                .cornerRadius(20)
        }
    }
}
