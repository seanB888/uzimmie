//
//  UzimmieHelp.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 2/1/24.
//

import SwiftUI

struct UzimmieHelp: View {
    @Binding var showSheet: Bool
    @State private var message = ""
    @State private var showButtons = false
    
    var body: some View {
        VStack {
            // MARK: -Header Section
            HStack {
                Spacer()
                Text("Uzimmie, Help")
                    .font(.headline)
                Spacer()
                Button {
                    showSheet = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(.black)
                        .imageScale(.large)
                        .padding(.trailing)
                }
            }
            .padding(.top)
            Divider()
            
            VStack {
                HStack {
                    Text("Chat's are monitored and recorded.")
                    Text("Learn More")
                        .fontWeight(.semibold)
                        .underline()
                }
                .foregroundStyle(.gray)
                .font(.caption)
                
                Spacer()
                
                VStack(spacing: 10) {
                    HelpButton(action: {}, title: "Product Questions")
                    HelpButton(action: {}, title: "Orders & Returns")
                    HelpButton(action: {}, title: "Exchanges")
                }
                HStack {
                    Text("Something else on yourmind? Type a message.")
                }
                .padding(.vertical)
                .foregroundStyle(.gray)
                .font(.caption)
                
                HStack {
                    // Add Button
                    Image(systemName: "plus")
                        .foregroundStyle(.black)
                        .background(.white)
                        .imageScale(.large)
                        .padding(10)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(lineWidth: 1.0))
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                showButtons.toggle()
                            }
                        }
                        .rotationEffect(Angle(degrees: showButtons ? 45 : 0))
                    
                    HStack {
                        Image(systemName: "camera.fill")
                            .imageScale(.large)
                            .padding(10)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(lineWidth: 1.0))
                        
                        Image(systemName: "square.fill.on.square.fill")
                            .imageScale(.large)
                            .padding(10)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(lineWidth: 1.0))
                    }
                    .opacity(showButtons ? 1 : 0)
                    .frame(width: showButtons ? 110 : 0)
                    
                    HStack {
                        TextField("Message Us...", text: $message)
                        Button {
                            
                        } label: {
                            Image(systemName: "arrow.up")
                                .foregroundStyle(.white)
                                .padding(5)
                                .background(.gray)
                                .clipShape(Circle())
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .overlay(Capsule().stroke(lineWidth: 1))
                }
                .padding(.horizontal)
            }
        }
        .background(.white)
        .foregroundStyle(.black)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

struct HelpButton: View {
    @State var action: () -> Void
    var title: String
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .fontWeight(.bold)
                .foregroundStyle(.black)
                .frame(width: 300)
                .padding(.vertical, 10)
                .clipShape(Capsule())
                .overlay(
                    Capsule().stroke(.black, lineWidth: 0.1)
                )
        }
    }
}
