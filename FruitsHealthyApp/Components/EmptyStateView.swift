//
//  EmptyStateView.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 27/08/2026.
//

import SwiftUI

// MARK: - Empty State View
// A reusable component to display an empty state with icon, title, and subtitle
struct EmptyStateView: View {
    let icon: String       // SF Symbol icon name
    let title: String      // Main title text
    let subtitle: String   // Supporting subtitle text

    var body: some View {
        VStack(spacing: 12) {
            // MARK: - Icon
            Image(systemName: icon)
                .font(.system(size: 40))
                .foregroundColor(.appTextGray.opacity(0.5))

            // MARK: - Title
            Text(title)
                .font(.h2)
                .foregroundColor(.appTextDark)

            // MARK: - Subtitle
            Text(subtitle)
                .font(.captionText)
                .foregroundColor(.appTextGray)
                .multilineTextAlignment(.center)
        }
        .padding(30)
        .frame(maxWidth: .infinity)
    }
}
