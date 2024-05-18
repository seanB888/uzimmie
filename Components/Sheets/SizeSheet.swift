//
//  SizeSheet.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 2/7/24.
//

import SwiftUI

struct SizeSheet: View {
    // @EnvironmentObject var cartManager: CartManager
    // let product: ProductItems // You need to pass the specific product
    // let productSizes: [ProductSize] // Array of ProductSize to choose from
    @Binding var selectedSize: String? // Currently selected size
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Select A Size")
                .font(.headline)
                .padding()
                .padding(.top, 15)
            
            Divider()
            
//            ScrollView {
//                VStack {
//                    ForEach(productSizes) { productSize in
//                        Button(action: {
//                            self.selectedSize = productSize.size
//                            // self.selectedSize = productSize.size
//                            guard let size = selectedSize else { return }
//                            cartManager.addToCart(product: product, selectedSize: size)
//                            self.isPresented = false
//                        }) {
//                            HStack {
//                                Text(productSize.size)
//                                    .foregroundColor(selectedSize == productSize.size ? .black : .gray)
//                                
//                                // Display message based on quantity
//                                Text(stockMessage(for: productSize.quantity))
//                                    .foregroundColor(.black)
//                                    .font(.footnote)
//                                
//                                Spacer()
//                                
//                                if selectedSize == productSize.size {
//                                    Image(systemName: "checkmark")
//                                        .foregroundColor(.black)
//                                }
//                            }
//                            .padding()
//                            .contentShape(Rectangle())
//                        }
//                        .buttonStyle(PlainButtonStyle())
//                        Divider()
//                    }
//                }
//                .padding(.horizontal)
//            }
        }
        .frame(maxHeight: UIScreen.main.bounds.height / 2)
        .background(Color.white)
        .cornerRadius(5)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.gray, lineWidth: 0.1)
        )
    }
    
    private func stockMessage(for quantity: Int) -> String {
        switch quantity {
        case 0:
            return "Currently out of stock"
        case 1...5:
            return "Just a few left"
        default:
            return ""
        }
    }
}

