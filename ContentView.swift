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
    
    var body: some View {
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
        
    }
}

#Preview {
    ContentView()
        .environmentObject(CartManager())
        .environmentObject(AuthManager())
}
