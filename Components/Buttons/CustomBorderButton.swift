//
//  CustomButton.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 1/27/24.
//

import SwiftUI

struct CustomBorderButton: View {
    @State var action: () -> Void
    var buttonTitle: String
    var foregroundColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(buttonTitle)
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(backgroundColor)
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(foregroundColor)
                .overlay(RoundedRectangle(cornerRadius: 50).stroke().fill(Color.black))
                .padding()
            
            
            
        }
        
    }
}

#Preview {
    CustomBorderButton(
        action: {},
        buttonTitle: "Sign up",
        foregroundColor: .black,
        backgroundColor: .clear
    )
}
