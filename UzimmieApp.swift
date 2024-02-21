//
//  UzimmieApp.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 1/25/24.
//

import SwiftUI
import Firebase

@main
struct UzimmieApp: App {
    @StateObject var authManager = AuthManager()
    @StateObject var viewRouter = ViewRouter()
    @StateObject var cartManager = CartManager()
    @StateObject var productModel = ProductModel()
    @StateObject var categoryModel = CategoryListModel()
    
    init() {
        // Configure Firebase
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            switch viewRouter.currentPage {
            case .home:
                ContentView()
                    .environmentObject(viewRouter)
                    .environmentObject(cartManager)
                    .environmentObject(WishListManager())
                    .environmentObject(productModel)
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
