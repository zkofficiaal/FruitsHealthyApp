import SwiftUI
import Combine

// MARK: - Custom Tab Bar
// Bottom tab bar with selectable icons and center add button
struct CustomTabBar: View {
    @Binding var selectedTab: AppTab
    var onAddTapped: () -> Void = {}

    var body: some View {
        HStack(spacing: 0) {
            tabButton(.home, "house.fill")
            Spacer()
            tabButton(.fruits, "leaf.fill")
            Spacer()
            centerAddButton
            Spacer()
            tabButton(.stats, "chart.bar.fill")
            Spacer()
            tabButton(.profile, "person.fill")
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 14)
        .background(Color.appCard)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .shadow(color: .black.opacity(0.06), radius: 8, y: -2)
        .padding(.horizontal)
        .padding(.bottom, 8)
    }

    // MARK: - Tab Button
    private func tabButton(_ tab: AppTab, _ symbol: String) -> some View {
        Button {
            selectedTab = tab
        } label: {
            Image(systemName: symbol)
                .font(.system(size: 18))
                .foregroundColor(selectedTab == tab ? .appGreen : .appTextGray)
                .frame(maxWidth: .infinity) // ensures even spacing
                .contentShape(Rectangle())  // improves tap area
        }
    }

    // MARK: - Center Add Button
    private var centerAddButton: some View {
        Button(action: onAddTapped) {
            Image(systemName: "plus")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
                .frame(width: 44, height: 44)
                .background(Color.appGreen)
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.1), radius: 4, y: 2)
        }
    }
}

// MARK: - AppTab Equatable
extension AppTab: Equatable {}
