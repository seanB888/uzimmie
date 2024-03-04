//
//  StoreInteraction.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 2/7/24.
//
import UIKit

class StoreInteraction {
    func shareProduct(product: ProductItems, appURL: URL) -> [Any] {
        // Combine title and category in one string for clarity
        let title = "\(product.title)"
        let category = "\(product.category)"
        
        let productDetails = """
        \(title)
        \(category)
        Description: \(product.description)
        Price: $\(product.price)
        Check this out in the Uzimmie app: \(appURL.absoluteString)
        """
        
        let downloadMessage = "You can check out more amazing products like this in the Uzimmie app. Download it today at \(appURL.absoluteString)"
        
        // Assume productImageName corresponds to an image in your asset catalog
        var itemsToShare: [Any] = [productDetails, downloadMessage]
        
        // If there's an image, add it to the share items
        if let image = UIImage(named: "\(product.productImage)") {
            itemsToShare.insert(image, at: 0) // This makes the image the first item
        }
        
        return itemsToShare
    }
}
