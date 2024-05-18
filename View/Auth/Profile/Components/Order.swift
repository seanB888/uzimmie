//
//  Order.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 2/1/24.
//

import SwiftUI

struct Order: View {
    @Environment(\.presentationMode) var goBack
    
    var body: some View {
        VStack {
            // Header
            Header(
                action: {
                    goBack.wrappedValue.dismiss()
                },
                headerTitle: "orders",
                headerSubTitle: "Your Orders",
                headerIcon: "arrow.left",
                fontSize: 44
            )
            
            Text("You haven't completed an order yet.")
                .font(.headline)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(.white)
        .foregroundStyle(.black)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Order()
}
