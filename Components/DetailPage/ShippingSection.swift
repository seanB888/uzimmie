//
//  ShippingSection.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 1/27/24.
//

import SwiftUI

struct ShippingSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Divider()
            VStack(alignment: .leading) {
                Text("Shipping")
                    .font(.headline)
                
                HStack {
                    Text("Arrives by Fri, Feb 2 ")
                        .font(.callout)
                    Text("Edit Location")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .underline(color: Color.black)
                }
            }
            
            VStack(alignment: .leading) {
                Text("Pickup")
                    .font(.headline)
                
                HStack {
                    Text("Unavailable for your ")
                        .font(.callout)
                    Text("Your Location")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .underline(color: Color.black)
                }
            }
        }
    }
}

#Preview {
    ShippingSection()
}
