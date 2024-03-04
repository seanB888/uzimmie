//
//  ProductViewModel.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 2/23/24.
//

import Combine
import Firebase
import FirebaseDatabase

class ProductViewModel: ObservableObject {
    @Published var products: [ProductItems] = []
    
    init() {
        fetchProducts()
    }
    
    private var dbRef = Database.database().reference()
    
    private func fetchProducts() {
        dbRef.child("products").observeSingleEvent(of: .value, with: { snapshot in
            DispatchQueue.main.async { // Ensure UI updates on the main thread.
                if let productDicts = snapshot.value as? [String: [String: Any]] {
                    self.products = productDicts.compactMap { key, value in
                        guard key != "<null>" else { return nil } // Handle null keys if they exist.
                        return ProductItems(id: key, data: value)
                    }
                }
            }
        }) { error in
            print("Error fetching products: \(error.localizedDescription)")
            self.products = [] // Default state if there's an error.
        }
    }
}
