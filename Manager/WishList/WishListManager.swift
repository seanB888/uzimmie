//
//  WishListManager.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 2/9/24.
//

import Foundation

class WishListManager: ObservableObject {
    @Published var wishlistItems: [Product] = []

    func addToWishlist(product: Product) {
        // Avoid adding duplicate items
        if !wishlistItems.contains(where: { $0.id == product.id }) {
            wishlistItems.append(product)
        }
    }

    func removeFromWishlist(product: Product) {
        wishlistItems.removeAll { $0.id == product.id }
    }
}
