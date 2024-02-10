//
//  CustomButton.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 1/27/24.
//

import SwiftUI

struct CustomSolidButton: View {
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
                .clipShape(Capsule())
                .padding()
        }
        
    }
}

#Preview {
    CustomSolidButton(
        action: {},
        buttonTitle: "Sign in",
        foregroundColor: .white,
        backgroundColor: .black
    )
}
