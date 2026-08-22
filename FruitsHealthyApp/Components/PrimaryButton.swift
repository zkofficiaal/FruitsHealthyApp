//
//  PrimaryButton.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 21/08/2026.
//

import SwiftUI

// MARK: - Primary Button
// Reusable button with text and optional icon
struct PrimaryButton: View {
    let title: String               // Button label text
    var icon: String? = nil         // Optional SF Symbol icon
    let action: () -> Void          // Action closure

    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Text(title).font(.buttonText)
                if let icon {
                    Image(systemName: icon).font(.buttonText)
                }
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 15)
            .background(Color.appGreen)
            .cornerRadius(16)
        }
    }
}
