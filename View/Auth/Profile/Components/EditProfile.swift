//
//  EditProfile.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 1/31/24.
//

import SwiftUI

struct EditProfile: View {
    @Environment(\.presentationMode) var goBack
    @State var firstName = ""
    @State var lastName = ""
    @State var homeTown = ""
    @State var textBox = ""
    @State var savedDocument = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 5) {
                // MARK: - Back button
                HStack {
                    Button {
                        goBack.wrappedValue.dismiss()
                    } label: {
                        Text("Cancel")
                    }
                    
                    Spacer()
                    
                    Button {
                        savedDocument = true
                    } label: {
                        if savedDocument {
                            Image(systemName: "checkmark")
                                .foregroundStyle(.black)
                        } else {
                            Text("Save")
                                .foregroundStyle(.gray)
                        }
                    }
                }
                .font(.callout)
                .foregroundStyle(.black)
                .padding(.horizontal)
                
                Divider()
                    .padding(.bottom)
                    .padding(.top, 10)
                // MARK: - Profile picture
                Button {
                    // action to upload button here...
                    
                } label: {
                    ZStack {
                        Image("Profile")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                        
                        Image(systemName: "camera.fill")
                            .foregroundStyle(.white)
                            .opacity(0.7)
                            .imageScale(.large)
                            .offset(y: 13)
                    }
                }
                
                VStack {
                    Text("Edit")
                        .fontWeight(.semibold)
                }
                
                // MARK: - Your name
                VStack(alignment: .leading, spacing: 5) {
                    Text("Name")
                        .font(.footnote)
                        .foregroundStyle(Color.theme.darrkGray)
                    HStack {
                        TextField("Sean", text: $firstName)
                            .padding()
                            .overlay(Rectangle().stroke(Color.black, lineWidth: 0.5))
                    }
                     HStack {
                        TextField("Blake", text: $lastName)
                            .padding()
                            .overlay(Rectangle().stroke(Color.black, lineWidth: 0.5))
                    }
                     .offset(y: -5)
                    
                }
                
                .padding(.horizontal)
                
                // MARK: - Hometown
                 VStack(alignment: .leading, spacing: 5) {
                     Text("Hometown")
                         .font(.footnote)
                         .foregroundStyle(Color.theme.darrkGray)
                    HStack {
                        TextField("Fort Lauderdale", text: $homeTown)
                            .padding()
                            .overlay(Rectangle().stroke(Color.black, lineWidth: 0.5))
                    }
                    
                }
                .padding(.horizontal)
                
                // MARK: - Bio
                VStack(alignment: .leading, spacing: 5) {
                     HStack {
                         Text("Bio")
                         Spacer()
                         Text("0/150")
                     }
                     .font(.footnote)
                     .foregroundStyle(Color.theme.darrkGray)
                     
                    HStack {
                        TextEditor(text: $textBox)
                            .lineLimit(5)
                            .padding()
                            .overlay(Rectangle().stroke(Color.black, lineWidth: 0.5))
                    }
                    
                }
                .padding(.top)
                .padding(.horizontal)
                
                
                Spacer()
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(.white)
            .foregroundStyle(.black)
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    EditProfile()
}
