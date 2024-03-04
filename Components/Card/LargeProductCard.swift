//
//  ProductCard.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 1/25/24.
//

import SwiftUI

struct LargeProductCard: View {
    @State var action: () -> Void
    @State var productTitle: String
    @State var productCategory: String
    @State var productPrice: String
    @State var productImages: [String]
    
    var placeholderImage: Image
    
    var body: some View {
        ZStack {
            // MARK: -Product Image
            Group {
                if let urlString = productImages.first, let url = URL(string: urlString) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                } else {
                    placeholderImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .frame(width: 336)
            
//            AsyncImage(url: URL(string: productImage.first ?? placeholderImage)) { image in
//                image
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//            } placeholder: {
//                ProgressView()
//            }
//            .frame(width: 336)
            
            // MARK: - Product Information
            
            VStack(alignment: .leading) {
                Text(productTitle)
                    .font(.system(size: 30))
                    .fontWeight(.semibold)
                
                Text(productCategory)
                    .font(.callout)
                    .foregroundStyle(.orange)
                    .padding()
                    .background(.black)
                    .clipShape(Capsule())
                
                Spacer()
                // MARK: - Price bar at bottom
                HStack {
                    Text("\(productPrice)")
                        .font(.system(size: 22, weight: .semibold))
                    Spacer()
                    
                    // MARK: - Add to cart
                    Button(action: {
                        // add button action here...
                        action()
                    }, label: {
                        Image(systemName: "bag")
                            .imageScale(.large)
                            .foregroundStyle(.white)
                            .frame(width: 40, height: 40)
                            .padding()
                            .background(.black)
                            .clipShape(Capsule())
                    })
                    .offset(x: 10)
                }
                .padding(.leading)
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .background(.white.opacity(0.7))
                .clipShape(Capsule())
            }
            .padding(30)
            .frame(width: 336, height: 422)
        }
        .frame(width: 336, height: 422)
        .background(.gray.opacity(0.13))
        .clipShape(.rect(cornerRadius: 57))
        .padding(.leading, 20)
    }
}

#Preview {
    LargeProductCard(
        action: {},
        productTitle: "Snake Knot",
        productCategory: "Bracelet",
        productPrice: "$15.00",
        productImages: ["https://uzimmie.com/p/products/hoodies/hoodie-1.png", "https://uzimmie.com/p/products/hoodies/hoodie-2.png"], 
        placeholderImage: Image("design")
    )
    .environmentObject(CartManager())
    .environmentObject(ProductViewModel())
    .environmentObject(CategoryListModel())
}
