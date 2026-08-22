import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var router: AppRouter

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottomLeading) {
                Image("onboarding_fruits")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.height)
                    .clipped()
                    .ignoresSafeArea()

                LinearGradient(
                    colors: [.black.opacity(0.55), .clear],
                    startPoint: .bottom, endPoint: .top
                )
                .ignoresSafeArea()

                VStack(alignment: .leading, spacing: geo.size.height * 0.02) {
                    Text("Eat Fruits\nLive Healthy")
                        .font(.appFont(min(geo.size.width * 0.08, 32), weight: .bold))
                        .foregroundColor(.white)

                    Text("Fresh fruits, your daily dose of nature's best.")
                        .font(.bodyText)
                        .foregroundColor(.white.opacity(0.85))

                    PrimaryButton(title: "Get Started", icon: "arrow.right") {
                        router.completeOnboarding()
                    }
                    .padding(.top, 8)
                }
                .padding(geo.size.width * 0.06)
                .padding(.bottom, geo.size.height * 0.03)
            }
        }
        .ignoresSafeArea()
    }
}
