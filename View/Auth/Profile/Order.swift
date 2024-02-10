//
//  Order.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 2/1/24.
//

import SwiftUI

struct Order: View {
    var body: some View {
        VStack {
            Text("Orders")
                .font(.largeTitle)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(.white)
        .foregroundStyle(.black)
    }
}

#Preview {
    Order()
}
