//
//  WishListView.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 2/9/24.
//

import SwiftUI

struct WishListView: View {
    @Environment(\.presentationMode) var goBack
    // @EnvironmentObject var wishListManager: WishListManager
    
    var body: some View {
        VStack {
            Header(
                action: { 
                    goBack.wrappedValue.dismiss()
                },
                headerTitle: "wishlist",
                headerSubTitle: "Your Favorites",
                headerIcon: "arrow.left",
                fontSize: 44
            )
            
//            if wishListManager.wishlistItems.isEmpty {
//                VStack {
//                    Text("No love shown yet")
//                        .font(.headline)
//                        .fontWeight(.semibold)
//                }
//                .frame(maxHeight: .infinity)
//            } else {
//                ForEach(wishListManager.wishlistItems) { wish in
//                    WishlistCard(
//                        action: {},
//                        productImage: "\(wish.productImage)",
//                        productTitle: wish.title,
//                        productDescription: wish.description,
//                        productCategory: wish.category,
//                        productPrice: wish.price,
//                        productSize: "\(wish.productSizes)"
//                    )
//                }
//                .foregroundStyle(.black)
//                .background(.white)
//            }
        }
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(.white)
        .foregroundStyle(.black)
    }
}

#Preview {
    WishListView()
        // .environmentObject(WishListManager())
}
