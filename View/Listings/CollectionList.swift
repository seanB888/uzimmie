//
//  CollectionList.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 1/25/24.
//

import SwiftUI

struct CollectionList: View {
    @Environment(\.presentationMode) var goBackFromWhichYouCame
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var productModel: ProductModel
    @EnvironmentObject var categoryModel: CategoryListModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // MARK: - Header
                    Header(
                        action: {
                            goBackFromWhichYouCame.wrappedValue.dismiss()
                        },
                        headerTitle: "uzimmie",
                        headerSubTitle: "From Yard To The Flipping World",
                        headerIcon: "arrow.left",
                        fontSize: 55
                    )
                    
                    // MARK: -List of products
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                        ForEach(productList, id: \.id) { item in
                              SmallProductCard(
                                productTitle: item.title,
                                productCategory: item.category,
                                productPrice: "\(item.price)",
                                productImage: item.productImage
                              )
                        }
                    }
                }
                .navigationBarBackButtonHidden()
            }
            .foregroundStyle(.black)
            .background(.white)
        }
    }
}

#Preview {
    CollectionList()
        .environmentObject(CartManager())
        .environmentObject(ProductModel())
        .environmentObject(CategoryListModel())
}
