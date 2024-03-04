//
//  CartItemCard.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 1/25/24.
//

import SwiftUI

struct CartItemCard: View {
    @StateObject var productVM = ProductViewModel()
    @EnvironmentObject var cartManager: CartManager
    var cartItem: CartItem
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
                    Text(productTitle)
                        .fontWeight(.semibold)
                        .font(.title2)
                    
                    Text(productDescription)
                        .font(.callout)
                        .lineLimit(3)
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
            
            // MARK: Quantity and price
            HStack {
                // Quantity Button...
                HStack {
                    Text("Qty")
                    Button(action: {
                        // minus count action...
                        cartManager.decreaseQuantity(of: cartItem)
                    }) {
                        Image(systemName: "minus")
                            .foregroundStyle(.white)
                    }
                    .padding()
                    .frame(width: 40, height: 20)
                    .background {
                        Capsule().fill(.black)
                    }
                    
                    // Quantity count...
                    Text("\(cartItem.quantity)")
                    
                    Button(action: {
                        // plus count action...
                        cartManager.increaseQuantity(of: cartItem)
                    }) {
                        Image(systemName: "plus")
                            .foregroundStyle(.white)
                    }
                    .padding()
                    .frame(width: 40, height: 20)
                    .background {
                        Capsule().fill(.black)
                    }
                    
                    Spacer()
                    
                }
                .padding(.top)
                .frame(maxWidth: .infinity, alignment: .leading)

                
                // Delete Button
                Button {
                 // Delete action...
                 action()
                 } label: {
                    Image(systemName: "trash")
                       .foregroundStyle(.red)
                 }
                  .frame(width: 40)
                  .padding(.trailing,40)
                
                Spacer()
                
                Text(String(format: "$%.2f", productPrice))
                
                    
            }
            .font(.headline)
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            
            // MARK: Shipping information
            VStack(alignment: .leading, spacing: 20) {
                ShippingInformation(HeaderText: "Shipping", bodyText: "Arrives by Mon, Feb 5", titleText: "Edit Location")
                ShippingInformation(HeaderText: "Pickup", bodyText: "Unavailable at", titleText: "Sawgrass")
            }
            .padding(.horizontal)
            .frame(height: 150)
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
    }
}

#Preview {
    CartItemCard(
        cartItem: CartItem(product: ProductItems(id: "", data: ["": ""]), selectedSize: "M", quantity: 1), action: {}, productImage: "", productTitle: "", productDescription: "", productCategory: "", productPrice: 0.5, productSize: "")
    .environmentObject(ProductViewModel())
    .environmentObject(CartManager())
}

struct ShippingInformation: View {
    var HeaderText: String
    var bodyText: String
    var titleText: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(HeaderText)
                .font(.headline)
                .fontWeight(.semibold)
            
            HStack {
                Text(bodyText)
                Text(titleText)
                    .underline()
                    .fontWeight(.semibold)
            }
        }
    }
}
