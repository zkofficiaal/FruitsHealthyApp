import SwiftUI

// MARK: - Onboarding View
// Handles onboarding flow with welcome and setup steps
struct OnboardingView: View {
    @EnvironmentObject var router: AppRouter       // Router for navigation
    @EnvironmentObject var store: NutritionStore  // Store for applying onboarding values
    @StateObject private var vm = OnboardingViewModel() // ViewModel for onboarding state

    var body: some View {
        GeometryReader { geo in
            ZStack {
                if vm.step == 0 {
                    welcomeStep(geo: geo)
                } else {
                    setupStep(geo: geo)
                }
            }
        }
        .background(Color.appBackground.ignoresSafeArea())
    }

    // MARK: - Step 0: Welcome
    private func welcomeStep(geo: GeometryProxy) -> some View {
        ZStack(alignment: .bottomLeading) {
            // Background image
            Image("onboarding_fruits")
                .resizable()
                .scaledToFill()
                .frame(width: geo.size.width, height: geo.size.height)
                .clipped()
                .ignoresSafeArea()

            // Gradient overlay
            LinearGradient(colors: [.black.opacity(0.55), .clear],
                           startPoint: .bottom, endPoint: .top)
                .ignoresSafeArea()

            // Welcome text + button
            VStack(alignment: .leading, spacing: geo.size.height * 0.02) {
                Text("Eat Fruits\nLive Healthy")
                    .font(.appFont(min(geo.size.width * 0.08, 32), weight: .bold))
                    .foregroundColor(.white)
                Text("Fresh fruits, your daily dose of nature's best.")
                    .font(.bodyText)
                    .foregroundColor(.white.opacity(0.85))
                PrimaryButton(title: "Get Started", icon: "arrow.right") {
                    withAnimation { vm.next() }
                }
                .padding(.top, 8)
            }
            .padding(geo.size.width * 0.06)
            .padding(.bottom, geo.size.height * 0.03)
        }
    }

    // MARK: - Steps 1-3: Setup
    private func setupStep(geo: GeometryProxy) -> some View {
        VStack(spacing: 24) {
            // Back button (only visible after step 1)
            HStack {
                if vm.step > 1 {
                    Button { withAnimation { vm.back() } } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.appTextDark)
                    }
                }
                Spacer()
            }
            .padding(.top, 8)

            Spacer()

            // Step content
            switch vm.step {
            case 1:
                setupCard(title: "What's your name?") {
                    TextField("Your name", text: $vm.name)
                        .font(.h2)
                        .padding()
                        .background(Color.appCard)
                        .cornerRadius(14)
                }
            case 2:
                setupCard(title: "Daily calorie goal") {
                    HStack {
                        TextField("2000", text: $vm.calorieGoalText)
                            .keyboardType(.numberPad)
                            .font(.h2)
                        Text("kcal").foregroundColor(.appTextGray)
                    }
                    .padding()
                    .background(Color.appCard)
                    .cornerRadius(14)
                }
            default:
                setupCard(title: "Daily water goal") {
                    HStack {
                        TextField("8", text: $vm.waterGoalText)
                            .keyboardType(.numberPad)
                            .font(.h2)
                        Text("glasses").foregroundColor(.appTextGray)
                    }
                    .padding()
                    .background(Color.appCard)
                    .cornerRadius(14)
                }
            }

            Spacer()

            // Next / Start button
            PrimaryButton(title: vm.isLastStep ? "Start" : "Next") {
                if vm.isLastStep {
                    vm.apply(to: store)
                    router.completeOnboarding()
                } else {
                    withAnimation { vm.next() }
                }
            }
        }
        .padding(24)
    }

    // MARK: - Setup Card
    private func setupCard<Content: View>(title: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title).font(.h1)
            content()
        }
    }
}
