//
//  Review.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 3/2/24.
//

import Foundation

struct Review: Identifiable {
    let id = UUID()
    let date: String
    let rating: Int
    let reviewerName: String
    let text: String
    let title: String
    
    init(data: [String: Any]) {
        self.date = data["date"] as? String ?? ""
        self.rating = data["rating"] as? Int ?? 0
        self.reviewerName = data["reviewerName"] as? String ?? ""
        self.text = data["text"] as? String ?? ""
        self.title = data["title"] as? String ?? ""
    }
}
