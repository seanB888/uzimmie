//
//  CollectionView.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 1/25/24.
//

import SwiftUI

struct CollectionView: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var productModel: ProductModel
    @State private var selectedProduct: Product?
    var selectedCategory: String
    
    var filteredProducts: [Product] {
        productList.filter { product in
            selectedCategory == "All" || product.category == selectedCategory
        }
    }
    
    var body: some View {
        HStack {
            Text("Our **Collections**")
                .font(.system(size: 25))
            Spacer()
            NavigationLink {
                CollectionList()
            } label: {
                Image(systemName: "arrow.right")
                    .imageScale(.large)
                    .foregroundStyle(.black)
            }
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 15)
        
        //MARK: - Product List
        TabView {
            ForEach(filteredProducts, id: \.id) { item in
                NavigationLink(destination: DetailView(product: item).environmentObject(cartManager)) {
                    LargeProductCard(
                        action: {
                            self.selectedProduct = item
                            cartManager.addToCart(product: item)
                        },
                        productTitle: item.title,
                        productCategory: item.category,
                        productPrice: String(format: "$%.2f", item.price),
                        productImage: item.productImage
                    )
                    .environmentObject(cartManager)
//                    .background(
//                        NavigationLink(
//                            destination: DetailView(product: item).environmentObject(cartManager),
//                            isActive: .constant(selectedProduct == item),
//                            label: { EmptyView() }
//                        )
//                        .hidden() // Hide the NavigationLink to only use it for navigation
//                    )
                    .foregroundStyle(.black)
                }
            }
        }
        .frame(height: 450)
        .tabViewStyle(.page)
    }
}

#Preview {
    CollectionView(selectedCategory: "All")
        .environmentObject(CartManager())
        .environmentObject(ProductModel())
}

extension Product: Equatable {
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.id == rhs.id
    }
}
