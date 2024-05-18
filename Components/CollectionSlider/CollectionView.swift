//
//  CollectionView.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 1/25/24.
//

import SwiftUI

struct CollectionView: View {
    // @EnvironmentObject var cartManager: CartManager
    // @EnvironmentObject var productVM: ProductViewModel
    var selectedCategory: String
    
//    var filteredProducts: [ProductItems] {
//        productVM.products.filter { product in
//            selectedCategory == "All" || product.category == selectedCategory
//        }
//    }
    
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
//        TabView {
//            ForEach(filteredProducts, id: \.id) { item in
//                NavigationLink(destination: DetailView(product: item).environmentObject(cartManager)) {
//                    LargeProductCard(
//                        action: {
//                            cartManager.addToCart(product: item)
//                        },
//                        productTitle: item.title,
//                        productCategory: item.category,
//                        productPrice: String(format: "$%.2f", item.price),
//                        productImages: item.productImage,
//                        placeholderImage: Image("design-1")
//                    )
//                }
//                .environmentObject(cartManager)
//                .foregroundStyle(.black)
//            }
//        }
//        .frame(height: 450)
//        .tabViewStyle(.page)

    }
}

#Preview {
    CollectionView(selectedCategory: "All")
//        .environmentObject(CartManager())
//        .environmentObject(ProductViewModel())
}

//extension ProductItems: Equatable {
//    static func == (lhs: ProductItems, rhs: ProductItems) -> Bool {
//        return lhs.id == rhs.id
//    }
//}
