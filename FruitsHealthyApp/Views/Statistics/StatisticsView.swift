import SwiftUI
import Charts

// MARK: - Statistics View
// Screen for viewing calorie intake and nutrient ratio analytics
struct StatisticsView: View {
    @StateObject private var vm = StatisticsViewModel()
    @EnvironmentObject var router: AppRouter   // Router for navigation

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // MARK: - Header
                HStack {
                    // Back button → returns to Home
                    Button { router.goBackToHome() } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.appTextDark)
                    }

                    Spacer()

                    Text("Statistics").font(.h2)

                    Spacer()

                    // Ellipsis button → placeholder for future actions
                    Button {
                        // TODO: Wire to options sheet or menu
                    } label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.appTextDark)
                    }
                }

                rangeSelector

                // ... rest of your StatisticsView content ...
            }
            .padding(16)
        }
        .background(Color.appBackground.ignoresSafeArea())
    }

    // MARK: - Range Selector
    private var rangeSelector: some View {
        HStack {
            ForEach(StatsRange.allCases, id: \.self) { range in
                Text(range.rawValue)
                    .font(.captionText.bold())
                    .foregroundColor(vm.selectedRange == range ? .white : .appTextGray)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(vm.selectedRange == range ? Color.appGreen : Color.clear)
                    .cornerRadius(16)
                    .onTapGesture { vm.selectedRange = range }
            }
        }
        .padding(4)
        .background(Color.appCard)
        .cornerRadius(20)
    }
}
