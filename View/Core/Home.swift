//
//  Home.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 1/25/24.
//

import SwiftUI

struct Home: View {
    @State private var selectedCategory: String = "All"
    @EnvironmentObject var cartManager: CartManager
    @State private var navigateToView = false
    
    var body: some View {
        NavigationStack {
            VStack {
                // MARK: -Header
                Header(
                    action: {
                        navigateToView = true
                    },
                    headerTitle: "uzimmie",
                    headerSubTitle: "From Bull Bay to di Flippin World!",
                    headerIcon: "line.3.horizontal",
                    fontSize: 44
                )
                .padding(.bottom, 20)
                
                NavigationLink(destination: Profile(), isActive: $navigateToView) { EmptyView() }
                
                // MARK: - Category List
                CategoryNavBar(selectedCategory: $selectedCategory)
                    .padding(.leading, 10)
                
                // MARK: - Collection view
                CollectionView(selectedCategory: selectedCategory)
                    .environmentObject(cartManager)
                
                Spacer()
            }
            .foregroundStyle(.black)
            .background(.white)
        }
    }
}

#Preview {
    Home()
        .environmentObject(CartManager())
}
