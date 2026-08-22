//
//  AppFonts.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 21/08/2026.
//

import SwiftUI

// MARK: - App Fonts
// Defines reusable font styles for the app
extension Font {
    static func appFont(_ size: CGFloat, weight: Font.Weight = .regular) -> Font {
        .system(size: size, weight: weight, design: .rounded)
        // Returns a rounded system font with given size and weight
    }

    static let h1         = Font.appFont(26, weight: .bold)       // Large headline
    static let h2         = Font.appFont(18, weight: .semibold)   // Section title
    static let bodyText   = Font.appFont(14, weight: .regular)    // Body text
    static let captionText = Font.appFont(12, weight: .regular)   // Small caption
    static let buttonText  = Font.appFont(16, weight: .semibold)  // Button label
}
