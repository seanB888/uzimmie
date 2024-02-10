//
//  Pass.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 2/1/24.
//

import SwiftUI

struct Pass: View {
    @Environment(\.presentationMode) var goBack
    
    var body: some View {
        
        VStack {
            HStack {
                Button {
                    goBack.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .imageScale(.large)
                    .foregroundStyle(.black)
                }
                Spacer()
            }
            .padding(.horizontal)
            
            Text("Pass")
                .font(.title)
            
            Text("Member Since January 2010")
                .font(.footnote)
                .foregroundStyle(Color.theme.darrkGray)
            
            // QRCODE
            Rectangle()
                .frame(width: 350, height: 350)
            
            HStack(alignment: .center) {
                Text("Check in easily and get personalized service at Uzimmie stores and events.")
                Text("Learn more.")
                    .fontWeight(.semibold)
                
            }
            .font(.footnote)
            
            Spacer()
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(.white)
        .foregroundStyle(.black)
    }
}

#Preview {
    Pass()
}
