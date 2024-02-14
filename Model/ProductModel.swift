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
    Product(
        title: "Snake Bracelet",
        description: "550 paracord bracelet",
        category: "Bracelets",
        productImage: "bracelet-1",
        productColor: ["armyGreen"],
        productSizes: [
            ProductSize(size: "S", quantity: 1),
            ProductSize(size: "M", quantity: 5),
            ProductSize(size: "L", quantity: 0),
            ProductSize(size: "XL", quantity: 0)
        ],
        price: 24.0,
        reviews: [
            Review(reviewerName: "Mary Roberts", rating: 5, title: "Beautiful Fit", text: "Really loved this bracelet, fits perfectly!", date: Date()),
            
        ]
    ),
    Product(
        title: "Astronaut Helmet",
        description: "Vintage design motorcycle fullface helmet",
        category: "Helmets",
        productImage: "helmet-1",
        productColor: ["lightGray"],
        productSizes: [
            ProductSize(size: "S", quantity: 0),
            ProductSize(size: "M", quantity: 5),
            ProductSize(size: "L", quantity: 5),
            ProductSize(size: "XL", quantity: 1)
        ],
        price: 24.0,
        reviews: [
            Review(reviewerName: "Larry Hoover", rating: 5, title: "Beautiful Fit", text: "Really loved this helemt, fits perfectly and I can see and breath properly. I don't sweat when wearing it!", date: Date()),
            
        ]
    ),
    
]

