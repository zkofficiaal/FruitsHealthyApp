import SwiftUI

struct DonutProgressRing: View {
    let segments: [NutrientBreakdown]
    let centerValue: String
    let centerLabel: String
    var size: CGFloat = 160 // caller can pass GeometryReader-driven value

    var body: some View {
        ZStack {
            ForEach(Array(segments.enumerated()), id: \.element.id) { index, segment in
                let startAngle = angle(for: index)
                let endAngle = angle(for: index) + (Double(segment.percent) / 100.0) * 360.0

                Circle()
                    .trim(from: startAngle / 360, to: endAngle / 360)
                    .stroke(Color(hex: segment.colorHex), style: StrokeStyle(lineWidth: size * 0.11, lineCap: .butt))
                    .rotationEffect(.degrees(-90))
            }

            VStack(spacing: 2) {
                Text(centerValue).font(.h1).foregroundColor(.appTextDark)
                Text(centerLabel).font(.captionText).foregroundColor(.appTextGray)
            }
        }
        .frame(width: size, height: size)
    }

    private func angle(for index: Int) -> Double {
        var total = 0.0
        for i in 0..<index { total += Double(segments[i].percent) / 100.0 * 360.0 }
        return total
    }
}
