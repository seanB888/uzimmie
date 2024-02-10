//
//  CustomAlert.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 2/8/24.
//

import SwiftUI

struct CustomAlert: View {
    @State var message: String
    @State var icon: String
    
    var body: some View {
        VStack {
            Spacer()

            HStack(spacing: 20) {
                Text(message)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Image(systemName: icon)
                    .foregroundStyle(.white)
            }
            .padding(.horizontal, 35)
            .padding(.vertical)
            .background(Color.black)
            .frame(maxWidth: .infinity)
            .padding()
        }
    }
}


#Preview {
    CustomAlert(message: "Product added to your Bag!", icon: "bag.fill")
}
