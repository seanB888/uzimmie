//
//  CommunicationSection.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 1/27/24.
//

import SwiftUI

struct CommunicationSection: View {
    @State var shareAction: () -> Void
    @State private var showSheet = false
    var message = 2
    @State var image: String
    @State var title: String
    @State var category: String
    @State var description: String
    
    var body: some View {
        VStack {
            Divider()
            HStack {
                HStack {
                    
                    if message > 2 {
                        Image(systemName: "envelope")
                            .imageScale(.medium)
                    } else {
                        Image(systemName: "envelope.badge")
                            .symbolRenderingMode(.multicolor)
                            .imageScale(.medium)
                    }
                    
                    Button {
                        showSheet = true
                    } label: {
                        Text("Message")
                    }
                    .sheet(isPresented: $showSheet) {
                        UzimmieHelp(showSheet: $showSheet)
                    }
                }
                Spacer()
                
                VStack {
                    ShareLink(item: image,
                              subject: Text(category),
                              message: Text(description),
                              preview: SharePreview(title, image: image))
                    {
                        HStack {
                            Image(systemName: "square.and.arrow.up")
                                .imageScale(.medium)
                            Text("Share")
                        }
                    }
                }
                
            }
            .padding(.horizontal, 60)
            .frame(maxHeight: 150)
            .frame(maxWidth: .infinity)
        }
        .background(.white)
    }
}

#Preview {
    CommunicationSection(shareAction: {}, image: "profile", title: "Car Culture", category: "Tees", description: "Style car for the streets.")
}
