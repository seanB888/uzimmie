//
//  WishListManager.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 2/9/24.
//

import Foundation

class WishListManager: ObservableObject {
    @Published var wishlistItems: [ProductItems] = []

    func addToWishlist(product: ProductItems) {
        // Avoid adding duplicate items
        if !wishlistItems.contains(where: { $0.id == product.id }) {
            wishlistItems.append(product)
        }
    }

    func removeFromWishlist(product: ProductItems) {
        wishlistItems.removeAll { $0.id == product.id }
    }
}
