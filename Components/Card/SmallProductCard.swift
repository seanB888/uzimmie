//
//  SmallProductCard.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 1/25/24.
//

import SwiftUI

struct SmallProductCard: View {
    @State var productTitle: String
    @State var productCategory: String
    @State var productPrice: String
    @State var productImage: String
//    var cardWidth: CGFloat = 168
//    var cardHeight: CGFloat = 211
//    var cardCorner: CGFloat = 26
    
    var body: some View {
        ZStack {
            // MARK: -Product Image
            Image(productImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 168)
            
            // MARK: - Product Information
            
            VStack {
                Text(productTitle)
                    .lineLimit(2)
                    .font(.system(size: 30))
                    .fontWeight(.semibold)
                    .frame(width: 160)
                
                
                Spacer()
                // MARK: - Price bar at bottom
                HStack {
                    Text("$\(productPrice)")
                        .font(.system(size: 18, weight: .semibold))
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background(.white.opacity(0.7))
                .clipShape(Capsule())
            }
            .padding(15)
            .frame(width: 168, height: 211)
        }
        .frame(width: 168, height: 211)
        .background(.gray.opacity(0.13))
        .clipShape(.rect(cornerRadius: 26))
        .padding(.vertical, 10)
    }
}


#Preview {
    SmallProductCard(
        productTitle: "Snake Knot",
        productCategory: "Bracelet",
        productPrice: "15.0",
        productImage: "design-1"
    )
}
