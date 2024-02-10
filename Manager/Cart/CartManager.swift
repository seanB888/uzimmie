//
//  CartManager.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 1/25/24.
//

import SwiftUI

struct CartItem: Identifiable {
    let id: UUID
    var product: Product
    var selectedSize: String
    var quantity: Int = 1

    init(product: Product, selectedSize: String, quantity: Int = 1) {
        self.id = UUID()
        self.product = product
        self.selectedSize = selectedSize
        self.quantity = quantity
    }
}

class CartManager: ObservableObject {
    @Published private(set) var items: [CartItem] = []
    // @Published private(set) var products: [Product] = []
    @Published private(set) var total: CGFloat = 0.0
    
    func addToCart(product: Product, selectedSize: String? = nil) {
        // Check if the item is already in the cart to update the quantity
        if let index = items.firstIndex(where: { $0.product.id == product.id && $0.selectedSize == selectedSize }) {
            items[index].quantity += 1 // Increase quantity if the same product and size are added
        } else {
            // Add new item since it doesn't exist
            let newItem = CartItem(product: product, selectedSize: selectedSize ?? "")
            items.append(newItem)
        }
        total += product.price + 5.25 // 5.25 is shipping and handling price
    }
    
    func removeFromCart(item: CartItem) {
        items.removeAll { $0.id == item.id }
        // Adjust total accordingly
    }
    
    var productCount: Int {
        items.reduce(0) { $0 + $1.quantity }
    }
}
