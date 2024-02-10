//
//  Profile.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 1/31/24.
//

import SwiftUI

struct Profile: View {
    @Environment(\.presentationMode) var goBack
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 5) {
                // MARK: - Back button
                HStack {
                    Button {
                        goBack.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .foregroundStyle(.black)
                            .imageScale(.large)
                    }
                    .padding(.top, 30)
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                // MARK: - Profile picture
                VStack {
                    Image("Profile")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    .clipShape(Circle())
                }
                .padding(.bottom, 30)
                
                VStack {
                    Text("Sean Blake")
                        .fontWeight(.semibold)
                    
                    Text("Fort Lauderdale")
                        .foregroundStyle(Color.theme.darrkGray)
                        .font(.footnote)
                }
                
                .padding(.bottom)
                
                // MARK: - Edit profile button
                NavigationLink(destination: EditProfile()) {
                    Text("EDIT PROFILE")
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        .padding()
                        .frame(width: 200, height: 44)
                        .border(Color.black.opacity(0.5))
                        .padding(.top)
                }
                
                // MARK: - Edit profile button
                NavigationLink(destination: WishListView()) {
                    Text("Your Wishlist")
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        .padding()
                        .frame(width: 200, height: 44)
                        .border(Color.black.opacity(0.5))
                        .padding(.top)
                }
                
                // MARK: - Settings buttons
                HStack {
                    // Orders button
                    NavigationLink(destination: Order()) {
                        ProfileIconButton(imageIcon: "archivebox.fill", titleText: "Orders")
                    }
                    VerticalDivider()
                    // Pass button
                    NavigationLink(destination: Pass()) {
                        ProfileIconButton(imageIcon: "person.crop.square.filled.and.at.rectangle.fill", titleText: "Pass")
                    }
                    VerticalDivider()
                    // Settings button
                    NavigationLink(destination: Settings()) {
                        ProfileIconButton(imageIcon: "gear", titleText: "Settings")
                    }
                    
                }
                .padding(.horizontal, 25)
                
                Spacer()
                    .frame(height: 100)
                    .background(.red)
                
                Divider()
                ListCardView(title: "INBOX", description: "View messages", messageCount: 1)
                Divider()
                ListCardView(title: "MEMBER REWARDS", description: "2 available", messageCount: 0)
                Divider()
//                ListCardView(title: "INBOX", description: "View messages", messageCount: 1)
                
                // MARK: - Memember since section
                HStack {
                    Text("Member Since January 2010")
                        .font(.footnote)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .frame(height: 44)
                .background(.gray).opacity(0.3)
                Spacer()
            }
            .padding(.top, 30)
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(.white)
            .foregroundStyle(.black)
            .navigationBarBackButtonHidden(true)
            
        }
    }
}

#Preview {
    Profile()
}

struct ListCardView: View {
    var title: String
    var description: String
    var messageCount: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text(title)
                    .fontWeight(.semibold)
                
                Text(description)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            Text("\(messageCount)")
                .padding(10)
                .background(Color.theme.accent)
                .clipShape(Circle())
                .padding(.trailing)
            
            Image(systemName: "chevron.right")
        }
        .frame(height: 80)
        .padding(.horizontal)
    }
}

struct VerticalDivider: View {
    var body: some View {
        Rectangle()
            .frame(width: 1, height: 50)
            .foregroundStyle(.gray)
    }
}
