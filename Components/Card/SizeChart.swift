//
//  SizeChart.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 2/7/24.
//

import SwiftUI

struct SizeChart: View {
    @State var image: String
    @State var description: String
    @State var sizeText: String
    
    var body: some View {
        VStack {
            HStack(spacing: 5) {
               Image(systemName: image)
               Text(description)
                Text(sizeText)
                    .fontWeight(.semibold)
                    
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 44)
            // .background(.red)
            
            Divider()
        }
    }
}

#Preview {
    SizeChart(image: "xmark.diamond", description: "Shirt shown is a size", sizeText: "M")
}
