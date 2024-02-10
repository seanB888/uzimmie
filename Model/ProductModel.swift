//
//  ProductModel.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 1/25/24.
//

import Foundation

class ProductModel: ObservableObject {
    @Published var products = productList
}

// The Model
struct Product: Identifiable {
    var id: UUID = .init()
    var title: String
    var description: String
    var category: String
    var productImage: String
    var productColor: [String]
    var productSizes: [ProductSize]
    var price: CGFloat
    var reviews: [Review]
}

// Define for ProductSize which includes size and quantity
struct ProductSize: Identifiable {
    let id = UUID()
    let size: String
    let quantity: Int
}

struct Review: Identifiable, Hashable {
    let id = UUID()
    let reviewerName: String
    let rating: Int
    let title: String
    let text: String
    let date: Date
}


// Sample Products
var productList = [
    Product(
        title: "Car Culture", 
        description: "Blue crew neck t-shirt with car graphic",
        category: "Tees",
        productImage: "design-1",
        productColor: ["bluee", "darrkGray", "yeellow", "armyGreen"],
        productSizes: [
            ProductSize(size: "S", quantity: 100),
            ProductSize(size: "M", quantity: 150),
            ProductSize(size: "L", quantity: 3),
            ProductSize(size: "XL", quantity: 0)
        ],
        price: 24.0,
        reviews: [
            Review(reviewerName: "Mark Roberts", rating: 5, title: "Great Product!", text: "Really loved this t-shirt, fits perfectly!", date: Date()),
            Review(reviewerName: "Sarah Nolan", rating: 5, title: "Love This Shirt", text: "The quality of the shirt is fabilous and it fits perfectly!", date: Date()),
            
        ]
    ),
    
]
