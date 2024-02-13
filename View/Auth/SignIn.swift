//
//  SignIn.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 1/27/24.
//

import SwiftUI

struct SignIn: View {
    @EnvironmentObject var authManager: AuthManager
    @Environment(\.presentationMode) var goBack
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    @State private var showPassword: Bool = false
    @State private var showConfirmPassword: Bool = false
    @State private var showContent: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 5) {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                
                Text("uzimmie")
                    .font(.largeTitle)
                    .fontWeight(.black)
                
                Text(showContent ? "Sign up" : "Log in")
                
                VStack {
                    HStack {
                        Image(systemName: "person.fill")
                        TextField(showContent ? "Username" : "Username/ email", text: $username)
                            .keyboardType(.emailAddress)
                    }
                    .padding()
                    .overlay(Capsule().fill(.clear).border(Color.black, width: 1))
                    .padding(.horizontal)
                    
                    // MARK: - Password
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "lock.fill")
                            if showPassword {
                                TextField("Password", text: $password)
                                    .keyboardType(.emailAddress)
                            } else {
                                SecureField("Password", text: $password)
                                    .keyboardType(.emailAddress)
                            }
                            
                            Button {
                                showPassword.toggle()
                            } label: {
                                Image(systemName: showPassword ? "eyes" : "eyebrow")
                            }
                            .foregroundStyle(.black)
                        }
                        .padding()
                        .overlay(Capsule().fill(.clear).border(Color.black, width: 1))
                        .padding(.horizontal)
                        
                        //MARK: - Sign up Section
                        if showContent {
                            HStack {
                                Image(systemName: "lock.fill")
                                if showConfirmPassword {
                                    TextField("Confirm Password", text: $confirmPassword)
                                        .keyboardType(.emailAddress)
                                } else {
                                    SecureField("Confirm Password", text: $confirmPassword)
                                        .keyboardType(.emailAddress)
                                }
                                
                                Button {
                                    showConfirmPassword.toggle()
                                } label: {
                                    Image(systemName: showConfirmPassword ? "eyes" : "eyebrow")
                                }
                                .foregroundStyle(.black)
                            }
                            .padding()
                            .overlay(Capsule().fill(.clear).border(Color.black, width: 1))
                            .padding(.horizontal)
                            
                            // MARK: - Sign up information
                            HStack {
                                Image(systemName: "envelope")
                                TextField("Email", text: $email)
                                    .keyboardType(.emailAddress)
                            }
                            .padding()
                            .overlay(Capsule().fill(.clear).border(Color.black, width: 1))
                            .padding(.horizontal)
                            
                            // Phone number
                            HStack {
                                Image(systemName: "phone.fill")
                                TextField("Telephone", text: $phoneNumber)
                                    .keyboardType(.numberPad)
                            }
                            .padding()
                            .overlay(Capsule().fill(.clear).border(Color.black, width: 1))
                            .padding(.horizontal)
                            
                            
                        }
                        
                        // MARK: - Troubleshoot link
                        if showContent {
                            HStack(spacing: 0) {
                                Text("Have an account?")
                                    .font(.footnote)
                                    .padding(.leading)
                                    .onTapGesture {
                                        showContent = false
                                }
                                Text("Sign in")
                                    .font(.footnote)
                                    .underline()
                                    .padding(.leading)
                                    .onTapGesture {
                                        showContent = false
                                }
                                Spacer()
                            }
                        } else {
                            Text("Trouble signing in")
                                .font(.footnote)
                                .underline()
                                .padding(.leading)
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                
                if showContent == false {
                    CustomSolidButton(
                        action: {
                            authManager.logIn()
                        },
                        buttonTitle: "Sign in",
                        foregroundColor: .black,
                        backgroundColor: .orange
                        
                    )
                }
                
                // MARK: - Sign up
                if showContent {
                    CustomSolidButton(
                        action: {
                            authManager.logIn()
                        },
                        buttonTitle: "Sign up",
                        foregroundColor: .orange,
                        backgroundColor: .black
                    )
                    
                    Text("Go Back From Which You Came")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .underline()
                        .onTapGesture {
                            goBack.wrappedValue.dismiss()
                        }
                    
                } else {
                    Button {
                        withAnimation(.easeInOut) {
                            showContent.toggle()
                        }
                    } label: {
                        Text("Register an Account")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    }
                    .foregroundStyle(.black)
                    
                    Button {
                        goBack.wrappedValue.dismiss()
                    } label: {
                        Text("Go back")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    }
                    .foregroundStyle(.black)
                    
                }
                
                
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(.white)
            .foregroundStyle(.black)
            .navigationBarBackButtonHidden(true)
        }
        .foregroundStyle(.black)
        .background(.white)
    }
}

#Preview {
    SignIn()
}
