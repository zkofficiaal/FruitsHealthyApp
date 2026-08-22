//
//  DonutProgressRing.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 21/08/2026.
//

import SwiftUI

// MARK: - Donut Progress Ring
// Visualizes nutrient distribution as a circular progress chart
struct DonutProgressRing: View {
    let segments: [NutrientBreakdown]   // Nutrient segments with percent and color
    let centerValue: String             // Center text value (e.g., "1200")
    let centerLabel: String             // Center label (e.g., "kcal")

    var body: some View {
        ZStack {
            ForEach(Array(segments.enumerated()), id: \.element.id) { index, segment in
                let startAngle = angle(for: index)
                let endAngle = angle(for: index) + (Double(segment.percent) / 100.0) * 360.0

                Circle()
                    .trim(from: startAngle / 360, to: endAngle / 360)
                    .stroke(Color(hex: segment.colorHex), style: StrokeStyle(lineWidth: 18, lineCap: .butt))
                    .rotationEffect(.degrees(-90))
            }

            VStack(spacing: 2) {
                Text(centerValue)
                    .font(.h1)
                    .foregroundColor(.appTextDark)
                Text(centerLabel)
                    .font(.captionText)
                    .foregroundColor(.appTextGray)
            }
        }
        .frame(width: 160, height: 160)
    }

    // MARK: - Angle Calculation
    // Computes start angle for each segment based on previous percentages
    private func angle(for index: Int) -> Double {
        var total = 0.0
        for i in 0..<index {
            total += Double(segments[i].percent) / 100.0 * 360.0
        }
        return total
    }
}
