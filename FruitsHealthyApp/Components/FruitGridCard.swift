import SwiftUI

// MARK: - Fruit Grid Card
// Vertical card layout: fruit image fills the top,
// name + kcal below, and a floating "+" button sits
// bottom-right on the image — matches reference design.
struct FruitGridCard: View {
    let fruit: Fruit              // Fruit model data
    var onAdd: () -> Void         // Action when "+" tapped

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // MARK: - Image with Floating Add Button
            ZStack(alignment: .bottomTrailing) {
                Image(fruit.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 90)
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 14))

                Button(action: onAdd) {
                    Image(systemName: "plus")
                        .font(.caption.bold())
                        .foregroundColor(.white)
                        .frame(width: 26, height: 26)
                        .background(Color.appGreen)
                        .clipShape(Circle())
                        .shadow(color: .black.opacity(0.15), radius: 3, y: 2)
                }
                .padding(6)
            }

            // MARK: - Text Info
            VStack(alignment: .leading, spacing: 2) {
                Text(fruit.name)
                    .font(.bodyText.bold())
                    .foregroundColor(.appTextDark)
                Text("\(fruit.kcal) kcal")
                    .font(.captionText)
                    .foregroundColor(.appTextGray)
            }
            .padding(.horizontal, 4)
        }
        .padding(8)
        .background(Color.appCard)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.04), radius: 6, y: 3)
    }
}
