//
//  DetailView.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 1/26/24.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var goBackButton
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var wishListManager: WishListManager
    
    @State var showMoreSizes = false
    @State private var showingCustomShareSheet = false
    @State private var showingSizeSheet = false
    @State private var selectedSize: String?
    @State private var showAlert = false
    @State private var loveProduct = false
    @State private var favIcon = false
    var product: Product
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    // MARK: - Nav area
                    Header(
                        action: {
                            goBackButton.wrappedValue.dismiss()
                        },
                        headerTitle: product.category,
                        headerSubTitle: product.title,
                        headerIcon: "arrow.left",
                        fontSize: 45
                    )
                    .padding(.top, 30)
                    
                    // MARK: - Product image
                    Image(product.productImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.gray.opacity(0.5))
                        .clipShape(.rect(cornerRadius: 25))
                    
                    // MARK: - Product category
                    VStack(alignment: .leading, spacing: 20) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(product.category)
                                .font(.callout)
                                .fontWeight(.semibold)
                                .padding(.vertical, 5)
                                .padding(.horizontal)
                                .background(Color.theme.accent)
                                .clipShape(Capsule())
                            
                            // MARK: - Product name
                            Text(product.title)
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                            
                            // MARK: - Product price
                            Text(String(format: "$%.2f", product.price))
                                .font(.headline)
                        }
                        
                        VStack(alignment: .leading, spacing: 10) {
                            // MARK: - Product description
                            Text(product.description)
                            
                            HStack {
                                Image(systemName: "smallcircle.filled.circle")
                                    .imageScale(.small)
                                
                                Text("Colors:")
                                // Available Colors
                                HStack {
                                    ForEach(product.productColor, id: \.self) { colorName in
                                        Rectangle()
                                            .foregroundColor(Color.theme.color(from: colorName))
                                            .frame(width: 15, height: 15)
                                    }
                                }
                            }
                            
                            
                            HStack {
                                Image(systemName: "smallcircle.filled.circle")
                                    .imageScale(.small)
                                
                                Text("Style: UZI04574-1040")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                            }
                        }
                        
                        Divider()
                        
                        // MARK: -Size chart
                        HStack {
                            Text("Size Chart")
                                .font(.headline)
                            Spacer()
                            Button{
                                withAnimation(.easeInOut) {
                                    showMoreSizes.toggle()
                                }
                            } label: {
                                Image(systemName: showMoreSizes ? "chevron.up" : "chevron.down")
                            }
                        }
                        .frame(height: 10)
                        // MARK: - Reusable cards
                        VStack(alignment: .leading) {
                            SizeChart(image: "xmark.diamond", description: "Shirt shown is a", sizeText: "M")
                            SizeChart(image: "xmark.diamond", description: "Standard fit:", sizeText: "Easy and traditional")
                        }
                        .opacity(showMoreSizes ? 1 : 0)
                        .frame(height: showMoreSizes ? 100 : 0)
                        
                        
                        // MARK: - Buttons
                        VStack(alignment: .center, spacing: 10) {
                            // MARK: - Select size button
                            Button {
                                // Action to select Size
                                showingSizeSheet.toggle()
                            } label: {
                                HStack(spacing: 2) {
                                    Text("Select Size")
                                        .padding()
                                        .foregroundStyle(.black)
                                        .background(.white)
                                    
                                    Image(systemName: "chevron.down")
                                        .imageScale(.large)
                                    
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .overlay(RoundedRectangle(cornerRadius: 50).stroke().fill(Color.black))
                            }
                            .sheet(isPresented: $showingSizeSheet) {
                                SizeSheet(product: product, productSizes: product.productSizes, selectedSize: $selectedSize, isPresented: $showingSizeSheet)
                                    .presentationDetents([.medium, .large])
                                    .presentationCompactAdaptation(.none)
                            }
                            .frame(maxHeight: UIScreen.main.bounds.height / 2)
                            
                            // MARK: - Add to bag
                            Button {
                                // cartManager.addToCart(produ)
                                if let selectedSize = selectedSize {
                                    print("The size selected is: \(selectedSize)")
                                } else {
                                    // more code later if no size is selected...
                                    print("Adding to cart with size: \(selectedSize ?? "")")
                                    cartManager.addToCart(product: product, selectedSize: selectedSize)
                                }
                                withAnimation(.easeInOut) {
                                    showAlert = true
                                }
                            } label: {
                                Text("Add to Bag")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .foregroundStyle(.white)
                                    .background(selectedSize == nil ? .gray : .black)
                                    .clipShape(.rect(cornerRadius: 50))
                                
                            }
                            .disabled(selectedSize == nil)
                            
                            // MARK: - Favorite button
                            Button {
                                // Action to add to Cart
                                withAnimation(.easeInOut) {
                                    loveProduct = true
                                    wishListManager.addToWishlist(product: product)
                                }
                                favIcon.toggle()
                            } label: {
                                HStack(spacing: 2) {
                                    Text("Favorite")
                                        .padding()
                                        .foregroundStyle(.black)
                                        .background(.white)
                                    
                                    Image(systemName: favIcon ? "suit.heart.fill" : "suit.heart")
                                        .imageScale(.large)
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .overlay(RoundedRectangle(cornerRadius: 50).stroke().fill(Color.black))
                            }
                            
                            Text("This product is excluded from all promotions and discount")
                                .font(.footnote)
                                .foregroundStyle(.gray)
                                .padding(.top, 20)
                                .padding(.horizontal)
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                        // MARK: - Shipping information
                        ShippingSection()
                        
                        // MARK: - Reviews
                        ReviewSection(reviews: product.reviews)
                        
                        // MAMRK: - Communications
                        CommunicationSection(shareAction: { showingCustomShareSheet = true }, image: product.productImage, title: product.title, category: product.category, description: product.description)
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // Add more details as needed
                    Spacer()
                }
                .padding()
                .toolbar(.hidden)
                .navigationBarBackButtonHidden()
                
            }
            .scrollIndicators(.hidden)
            .foregroundStyle(.black)
            .background(.white)
            .ignoresSafeArea()
            
            // Custom alert add to bag
            if showAlert {
                CustomAlert(message: "Product added to your bag", icon: "bag.fill")
                    .transition(.move(edge: .bottom))
                    .animation(.easeInOut(duration: 0.5), value: showAlert)
                    .onAppear {
                        // Dismiss the alert after a delay
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                showAlert = false
                            }
                        }
                    }
            }
            
            // Custom alert add to fav
            if loveProduct {
                CustomAlert(message: "You liked this product", icon: "heart.fill")
                    .transition(.move(edge: .bottom))
                    .animation(.easeInOut(duration: 0.5), value: showAlert)
                    .onAppear {
                        // Dismiss the alert after a delay
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                loveProduct = false
                            }
                        }
                    }
            }
            
            
        }
    }
}

#Preview {
    
    DetailView(product: productList[0])
        .environmentObject(CartManager())
        .environmentObject(WishListManager())
}
