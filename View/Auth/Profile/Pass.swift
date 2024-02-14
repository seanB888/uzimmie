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
            // Header
            Header(
                action: {
                    goBack.wrappedValue.dismiss()
                },
                headerTitle: "pass",
                headerSubTitle: "Your Special Pass",
                headerIcon: "arrow.left",
                fontSize: 44)
            
           // member since
            Text("Member Since January 2010")
                .font(.footnote)
                .foregroundStyle(Color.theme.darrkGray)
            
            // Will replace with QRCODE
            Rectangle()
                .frame(width: 350, height: 350)
            
            VStack(alignment: .center) {
                Text("Check in easily and get personalized service at Uzimmie stores and events.")
                Text("Learn more.")
                    .fontWeight(.semibold)
                
            }
            .padding(.horizontal)
            .font(.footnote)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(.white)
        .foregroundStyle(.black)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Pass()
}
