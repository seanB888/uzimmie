//
//  CartView.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 1/25/24.
//

import SwiftUI

struct CartView: View {
    @Environment(\.presentationMode) var goBackFromWhichYouCame
    @StateObject var viewRouter = ViewRouter()
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var productModel: ProductModel
    @EnvironmentObject var categoryModel: CategoryListModel
    @State var promoCode: String = ""
    @State var showPromoSection = false
    
    var body: some View {
        NavigationStack {
            VStack {
                // MARK: - Header
                Header(
                    action: {
                        goBackFromWhichYouCame.wrappedValue.dismiss()
                    },
                    headerTitle: "bag",
                    headerSubTitle: "Your Shopping Bag",
                    headerIcon: "arrow.left",
                    fontSize: 44
                )
                .foregroundStyle(.black)
                
                ScrollView {
                    // MARK: - Cart items
                    if !cartManager.items.isEmpty {
                        ForEach(cartManager.items) { item in
                            CartItemCard(
                                cartItem: item,
                                action: {
                                    cartManager.removeFromCart(item: item)
                                },
                                productImage: item.product.productImage,
                                productTitle: item.product.title,
                                productDescription: item.product.description,
                                productCategory: item.product.category,
                                productPrice: item.product.price, 
                                productSize: item.selectedSize
                            )
                        }
                    }  else {
                        // Empty bag message...
                        VStack(spacing: 20) {
                            Spacer()
                                .frame(height: 100)
                            Image(systemName: "bag")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                                .background {
                                    Circle()
                                        .stroke(.black, lineWidth: 1)
                                }
                            
                            VStack(alignment: .center) {
                                Text("Your Bag is Empty. \nWhen You add products, they'll appear here.")
                                    .multilineTextAlignment(.center)
                            }
                            .frame(width: 250)
                        }
                        .frame(height: 333)
                    }
                    if !cartManager.items.isEmpty {
                        Divider()
                        
                        // MARK: Promo section
                        VStack {
                            // Promo header
                            HStack {
                                Text("Promo Code")
                                    .font(.headline)
                                Spacer()
                                // button to drop down and pull up section
                                Button{
                                    withAnimation(.easeOut) {
                                        showPromoSection.toggle()
                                    }
                                } label: {
                                    Image(systemName: "plus")
                                        .rotationEffect(Angle(degrees: showPromoSection ? 45 : 0))
                                }
                            }
                            .padding(.horizontal)
                            .frame(height: 50)
                            .foregroundStyle(.black)
                            .background(.white)
                            // Text field to take promo code
                            VStack(alignment: .leading) {
                                TextField("Promo", text: $promoCode)
                                    .frame(width: 250, height: 50)
                                    .overlay(Rectangle().stroke(lineWidth: 1.0))
                            }
                            .padding(.top)
                            .opacity(showPromoSection ? 1 : 0)
                            .frame(maxWidth: .infinity)
                            .frame(height: showPromoSection ? 100 : 0)
                            .background(.white)
                            .foregroundStyle(.black)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: showPromoSection ? 100 : 0)
                        
                        
                        // MARK: - Total amount
                        VStack(alignment: .leading, spacing: 5) {
                            Divider()
                                .padding(.bottom)
                            HStack {
                                Text("Subtotal")
                                Spacer()
                                Text("$\(String(format: "%.2f", cartManager.total))")
                            }
                            .foregroundStyle(Color.gray)
                            
                            HStack {
                                Text("Shipping")
                                Spacer()
                                Text("Standard - Fee")
                            }
                            .foregroundStyle(Color.gray)
                            
                            HStack {
                                Text("Estimated Total")
                                Spacer()
                                Text("$\(String(format: "%.2f", cartManager.total)) + Tax")
                            }
                            .font(.subheadline)
                            .fontWeight(.bold)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 140)
                        .padding(.bottom, 3)
                        
                    }
                }
                Divider()
                // MARK: - Checkout Button
                if !cartManager.items.isEmpty {
                    CustomSolidButton(
                        action: {
                            // Pay action here...
                        },
                        buttonTitle: "Checkout",
                        foregroundColor: .white,
                        backgroundColor: .black
                    )
                } else {
                    Button {
                        viewRouter.currentPage = .home
                        print("Pressed to go back home")
                    } label: {
                        Text("Shop Now")
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
                            .background(.black)
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.white)
                            .clipShape(Capsule())
                            .padding()
                    }
                }
                
            }
            .padding(.horizontal)
            .background(.white)
            .foregroundStyle(.black)
            .navigationBarBackButtonHidden(true)
            
        }
        .background(.white)
    }
}

#Preview {
    CartView()
        .environmentObject(AppState())
        .environmentObject(CartManager())
        .environmentObject(ProductModel())
        .environmentObject(CategoryListModel())
}
