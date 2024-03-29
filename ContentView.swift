//
//  ContentView.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 1/25/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authManager: AuthManager
    @StateObject var cartManager = CartManager()
    @EnvironmentObject var productVM: ProductViewModel
    
    var body: some View {
        if authManager.isUserAuthenticated {
            NavigationStack {
                // testing secure login
                ZStack(alignment: .bottom) {
                    Home()
                    HStack {
                        NavigationLink(destination: SearchView()) {
                            SearchButton()
                                .shadow(color: .black.opacity(0.2), radius: 10, y: 5)
                        }
                        Spacer()
                        // MARK: - Add Cart button...
                        NavigationLink(destination: CartView()) {
                            CartButton()
                                .shadow(color: .black.opacity(0.2), radius: 10, y: 5)
                        }
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                }
            }
        } else {
            SignIn()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(CartManager())
        .environmentObject(ProductViewModel())
        .environmentObject(AuthManager())
        .environmentObject(WishListManager())
}
