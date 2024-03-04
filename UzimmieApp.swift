//
//  UzimmieApp.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 1/25/24.
//

import SwiftUI
import Firebase

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Configure Firebase here
        FirebaseApp.configure()
        return true
    }
}

@main
struct UzimmieApp: App {
    // Use the AppDelegate with UIApplicationDelegateAdaptor
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var authManager = AuthManager()
    @StateObject var viewRouter = ViewRouter()
    @StateObject var cartManager = CartManager()
    @StateObject var productVM = ProductViewModel()
    @StateObject var categoryModel = CategoryListModel()

    var body: some Scene {
        WindowGroup {
            switch viewRouter.currentPage {
            case .home:
                ContentView()
                    .environmentObject(viewRouter)
                    .environmentObject(cartManager)
                    .environmentObject(WishListManager())
                    .environmentObject(productVM)
                    .environmentObject(categoryModel)
                    .environmentObject(authManager)
            case .cart:
                CartView().environmentObject(viewRouter)
                // Navigate back to ContentView
                Button("Back to Home") {
                    viewRouter.currentPage = .home
                }
            }
        }
    }
}
