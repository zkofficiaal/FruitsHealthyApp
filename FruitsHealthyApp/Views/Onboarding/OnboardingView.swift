import SwiftUI

// MARK: - Onboarding View
// Intro screen with hero image, gradient overlay, top bar icons,
// motivational text, and a "Get Started" button.
struct OnboardingView: View {
    @EnvironmentObject var router: AppRouter   // Router for navigation

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottomLeading) {
                // MARK: - Background Image
                Image("onboarding_fruits")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.height)
                    .clipped()
                    .ignoresSafeArea()

                // MARK: - Gradient Overlay
                LinearGradient(
                    colors: [.black.opacity(0.55), .clear, .black.opacity(0.25)],
                    startPoint: .bottom, endPoint: .top
                )
                .ignoresSafeArea()

                // MARK: - Top Bar
                // Menu icon (left) and circular action icon (right)
                VStack {
                    HStack {
                        Button { } label: {
                            Image(systemName: "line.3.horizontal")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.appTextDark)
                                .frame(width: 40, height: 40)
                                .background(Color.white.opacity(0.9))
                                .clipShape(Circle())
                        }
                        Spacer()
                        Button { } label: {
                            Image(systemName: "leaf.fill")
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                                .frame(width: 40, height: 40)
                                .background(Color.appGreen)
                                .clipShape(Circle())
                        }
                    }
                    .padding(.horizontal, geo.size.width * 0.06)
                    .padding(.top, geo.safeAreaInsets.top + 8)
                    Spacer()
                }

                // MARK: - Text + Button
                VStack(alignment: .leading, spacing: geo.size.height * 0.02) {
                    Text("Eat Fruits\nLive Healthy")
                        .font(.appFont(min(geo.size.width * 0.08, 32), weight: .bold))
                        .foregroundColor(.appTextDark)

                    Text("Fresh fruits, your daily dose of nature's best.")
                        .font(.bodyText)
                        .foregroundColor(.appTextDark.opacity(0.75))

                    PrimaryButton(title: "Get Started", icon: "arrow.right") {
                        router.completeOnboarding()
                    }
                    .padding(.top, 8)
                }
                .padding(geo.size.width * 0.06)
                .padding(.bottom, geo.size.height * 0.05)
            }
        }
        .ignoresSafeArea()
    }
}
