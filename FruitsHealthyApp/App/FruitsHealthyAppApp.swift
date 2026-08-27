import SwiftUI

// MARK: - FruitsHealthyApp Entry Point
// Main application struct: initializes router and store,
// injects them into the environment for global access.
@main
struct FruitsHealthyAppApp: App {
    // MARK: - State Objects
    // Router handles navigation between views
    @StateObject private var router = AppRouter()
    // Store is the single source of truth for nutrition data
    @StateObject private var store = NutritionStore()

    // MARK: - Scene Body
    var body: some Scene {
        WindowGroup {
            // RootView is the main container view
            RootView()
                // Inject router and store into environment
                .environmentObject(router)
                .environmentObject(store)
        }
    }
}
