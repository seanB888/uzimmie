//
//  CartManager.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 1/25/24.
//

import Foundation
import SwiftUI

struct CartItem: Identifiable {
    let id: UUID
    var product: Product
    var selectedSize: String
    var quantity: Int

    init(product: Product, selectedSize: String, quantity: Int = 1) {
        self.id = UUID() // Unique identifier for each cart item
        self.product = product
        self.selectedSize = selectedSize
        self.quantity = quantity
    }
}

class CartManager: ObservableObject {
    @Published private(set) var items: [CartItem] = []
    @Published private(set) var total: CGFloat = 0.0
    
    func addToCart(product: Product, selectedSize: String? = nil) {
        guard let size = selectedSize, let sizeInfo = product.productSizes.first(where: { $0.size == size }) else { return }
        
        if let index = items.firstIndex(where: { $0.product.id == product.id && $0.selectedSize == size }) {
            // Check against available stock before increasing quantity
            if items[index].quantity < sizeInfo.quantity {
                items[index].quantity += 1
                total += product.price // Assuming price includes shipping/handling
            }
        } else {
            // Add new item since it doesn't exist and there's stock
            if sizeInfo.quantity > 0 {
                let newItem = CartItem(product: product, selectedSize: size)
                items.append(newItem)
                total += product.price // Update total accordingly
            }
        }
    }
    
    func removeFromCart(item: CartItem) {
        items.removeAll { $0.id == item.id }
        recalculateTotal()
    }
    
    func increaseQuantity(of item: CartItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }),
           let sizeInfo = item.product.productSizes.first(where: { $0.size == item.selectedSize }) {
            if items[index].quantity < sizeInfo.quantity {
                items[index].quantity += 1
                recalculateTotal()
            }
        }
    }

    func decreaseQuantity(of item: CartItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].quantity = max(items[index].quantity - 1, 1) // Ensure quantity doesn't go below 1
            recalculateTotal()
        }
    }

    private func recalculateTotal() {
        total = items.reduce(0) { $0 + ($1.product.price * CGFloat($1.quantity)) }
        // Removed the flat addition of shipping cost per product change. Adjust if needed.
    }
    
    // Ensure product count reflects the total number of items across all cart items
    var productCount: Int {
        items.reduce(0) { $0 + $1.quantity }
    }
}

