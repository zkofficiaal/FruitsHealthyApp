//
//  FruitsHealthyAppApp.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 21/08/2026.
//

import SwiftUI

// MARK: - App Entry Point
@main
struct FruitsHealthyAppApp: App {
    @StateObject private var router = AppRouter()
    // Creates the single shared AppRouter instance for the whole app lifecycle

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(router)
                // Injects AppRouter into the environment so any child view
                // (RootView, MainTabContainer, HomeView, etc.) can access it
                // via @EnvironmentObject var router: AppRouter
        }
    }
}
