//
//  WishListView.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 2/9/24.
//

import SwiftUI

struct WishListView: View {
    @Environment(\.presentationMode) var goBack
    @EnvironmentObject var wishListManager: WishListManager
    
    var body: some View {
        VStack {
            Header(
                action: { 
                    goBack.wrappedValue.dismiss()
                },
                headerTitle: "wishlist",
                headerSubTitle: "Your Wish",
                headerIcon: "arrow.left",
                fontSize: 40
            )
            
            List(wishListManager.wishlistItems) { product in
                Text(product.title) // Customize as per your UI needs
            }
            .foregroundStyle(.black)
            .background(.white)
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(.white)
        .foregroundStyle(.black)
    }
}

#Preview {
    WishListView()
        .environmentObject(WishListManager())
}
