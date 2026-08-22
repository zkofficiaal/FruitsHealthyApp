//
//  AppColors.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 21/08/2026.
//

import SwiftUI

// MARK: - App Color Palette
extension Color {
    static let appGreen      = Color(hex: "4CAF88")  // Primary green accent
    static let appGreenDark  = Color(hex: "2E7D5B")  // Darker shade for emphasis
    static let appCoral      = Color(hex: "FF7A6E")  // Coral highlight color
    static let appYellow     = Color(hex: "F5C34D")  // Yellow for warnings/highlights
    static let appBlue       = Color(hex: "5FA8D3")  // Blue for info or secondary accents
    static let appPurple     = Color(hex: "9B8CD9")  // Purple for decorative/secondary use
    static let appBackground = Color(hex: "F7F9F6")  // Global background color
    static let appCard       = Color(hex: "FFFFFF")  // Card or container background
    static let appTextDark   = Color(hex: "1F2A24")  // Primary text color
    static let appTextGray   = Color(hex: "8A9A90")  // Secondary/muted text color
}

// MARK: - Hex Color Initializer
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)           // Reads hex string
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)                   // Converts hex to integer
        let r = Double((rgb >> 16) & 0xFF) / 255     // Red channel
        let g = Double((rgb >> 8) & 0xFF) / 255      // Green channel
        let b = Double(rgb & 0xFF) / 255             // Blue channel
        self.init(red: r, green: g, blue: b)         // Initialize SwiftUI Color
    }
}
