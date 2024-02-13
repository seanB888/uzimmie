//
//  WishlistCard.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 2/12/24.
//

import SwiftUI

struct WishlistCard: View {
    @State var action: () -> Void
    var productImage: String
    var productTitle: String
    var productDescription: String
    var productCategory: String
    var productPrice: CGFloat
    var productCount: Int = 1
    var productSize: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Divider()
                .padding(.bottom)
            HStack(alignment: .top) {
                Image(productImage)
                    .resizable()
                    .scaledToFit()
                    .background(.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                    .frame(width: 150, height: 150)
                
                VStack(alignment: .leading) {
                    Text("\(productTitle)")
                        .font(.title2)
                    
                    Text(productDescription)
                        .font(.callout)
                        .opacity(0.5)
                    
                    Text(productCategory)
                        .font(.callout)
                        .opacity(0.5)
                    
                    // choosen size
                    HStack {
                        Text("Size:")
                        Text(productSize)
                            .fontWeight(.semibold)
                    }
                }
                .padding(.top)
                .frame(width: 150, height: 100, alignment: .leading)
                
            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    WishlistCard(
        action: {},
        productImage: "design-1",
        productTitle: "Blue Shirt",
        productDescription: "Blue car culture shirt. Crew neck style 100% cotton.",
        productCategory: "Tees",
        productPrice: 24.0,
        productSize: "M"
    )
}
