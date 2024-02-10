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
                    fontSize: 50
                )
                .foregroundStyle(.black)
                
                ScrollView {
                    // MARK: - Cart items
                    if !cartManager.items.isEmpty {
                        ForEach(cartManager.items) { item in
                            CartItemCard(
                                action: {
                                    cartManager.removeFromCart(item: item) // Make sure this method accepts a CartItem
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
                        // MARK: Pickup information
                        VStack {
                            HStack {
                                Text("Have a Promo Code?")
                                    .font(.headline)
                                Spacer()
                                Button {
                                    withAnimation(.easeInOut) {
                                        showPromoSection.toggle()
                                    }
                                } label: {
                                    Image(systemName: "plus")
                                        .rotationEffect(Angle(degrees: showPromoSection ? 45 : 90))
                                }
                            }
                            .padding(.top)
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity)
                            
                            TextField("Promo", text: $promoCode)
                                .frame(width: 150, height: 60)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: showPromoSection ? 150 : 0)
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
