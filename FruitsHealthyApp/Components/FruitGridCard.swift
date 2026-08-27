import SwiftUI

// MARK: - Fruit Grid Card
// Displays fruit info with image, kcal, and add button inside a NavigationLink
struct FruitGridCard: View {
    let fruit: Fruit              // Fruit model data
    var onAdd: () -> Void         // Action when add button tapped

    var body: some View {
        // MARK: - Navigation Link
        // Wraps the card so tapping navigates to fruit detail
        NavigationLink(value: fruit) {
            HStack(spacing: 12) {
                // MARK: - Fruit Image
                Image(fruit.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 44, height: 44)
                    .clipShape(Circle())

                // MARK: - Fruit Info
                VStack(alignment: .leading, spacing: 2) {
                    Text(fruit.name)
                        .font(.bodyText.bold())
                        .foregroundColor(.appTextDark)
                    Text("\(fruit.kcal) kcal")
                        .font(.captionText)
                        .foregroundColor(.appTextGray)
                }

                Spacer()

                // MARK: - Add Button
                Button(action: onAdd) {
                    Image(systemName: "plus")
                        .font(.caption.bold())
                        .foregroundColor(.white)
                        .frame(width: 22, height: 22)
                        .background(Color.appGreen)
                        .clipShape(Circle())
                }
                .buttonStyle(.plain) // prevents row tap from triggering NavigationLink
            }
            .padding(12)
            .background(Color.appCard)
            .cornerRadius(14)
            .shadow(color: .black.opacity(0.04), radius: 5, y: 2)
        }
        .buttonStyle(.plain) // ensures only explicit taps trigger navigation
    }
}
