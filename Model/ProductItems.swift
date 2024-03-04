//
//  Product.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 3/2/24.
//

import Foundation

struct ProductItems: Identifiable {
    public let id: String
    let title: String
    let description: String
    let category: String
    let price: Double
    let productImage: [String]
    let productColor: [String]
    let productSizes: [ProductSize]
    let reviews: [Review]
    
    init(id: String, data: [String: Any]) {
        self.id = id
        self.title = data["title"] as? String ?? ""
        self.description = data["description"] as? String ?? ""
        self.category = data["category"] as? String ?? ""
        self.price = data["price"] as? Double ?? 0.0
        // Assuming productImage is just a single String URL
        self.productImage = data["productImage"] as? [String] ?? []
        self.productColor = data["productColor"] as? [String] ?? []
        
        // If productSizes is a dictionary with size keys and quantity values
        if let sizesDict = data["productSizes"] as? [String: Int] {
            self.productSizes = sizesDict.map { size, quantity in
                ProductSize(size: size, quantity: quantity)
            }
        } else {
            self.productSizes = []
        }
        
        // If reviews is an array of dictionaries
        if let reviewsArray = data["reviews"] as? [[String: Any]] {
            self.reviews = reviewsArray.compactMap { Review(data: $0) }
        } else {
            self.reviews = []
        }
    }
}
