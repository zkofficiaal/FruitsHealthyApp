//
//  OnboardingView.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 21/08/2026.
//

import SwiftUI

// MARK: - Onboarding View
// Intro screen with hero image, motivational text, and start button
struct OnboardingView: View {
    @EnvironmentObject var router: AppRouter   // App router for navigation

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image("onboarding_fruits")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            LinearGradient(
                colors: [.black.opacity(0.55), .clear],
                startPoint: .bottom, endPoint: .top
            )
            .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 16) {
                Text("Eat Fruits\nLive Healthy")
                    .font(.appFont(30, weight: .bold))
                    .foregroundColor(.white)

                Text("Fresh fruits, your daily dose of nature's best.")
                    .font(.bodyText)
                    .foregroundColor(.white.opacity(0.85))

                PrimaryButton(title: "Get Started", icon: "arrow.right") {
                    router.completeOnboarding()
                }
                .padding(.top, 8)
            }
            .padding(24)
            .padding(.bottom, 30)
        }
    }
}
