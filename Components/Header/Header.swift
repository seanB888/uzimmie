//
//  Header.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 1/25/24.
//

import SwiftUI

struct Header: View {
    @EnvironmentObject var cartManager: CartManager
    @State var action: () -> Void
    var headerTitle: String
    var headerSubTitle: String
    var headerIcon: String
    var fontSize: CGFloat
    
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 5)
                .background(Color.blue)
            // MARK: - Text area
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text(headerTitle)
                        .fontWeight(.black)
                        .font(.system(size: fontSize))
                    
                    Text(headerSubTitle)
                        .font(.subheadline)
                }
            }
            
            Spacer()
                .background(Color.green)
            
            // MARK: - Button
            Button{
                action()
            } label: {
                Image(systemName: headerIcon)
                    .foregroundStyle(Color.black)
                    .imageScale(.large)
                    .padding()
                    .frame(width: 70, height: 90)
                    .overlay(RoundedRectangle(cornerRadius: 50).stroke().fill(.black))
            }
            .frame(width: 70)
            Spacer()
                .frame(width: 5)
        }
        .padding(.horizontal)
    }
}

#Preview {
    Header(
        action: {},
        headerTitle: "uzimmie",
        headerSubTitle: "From Bull Bay to di flippin World",
        headerIcon: "line.3.horizontal",
        fontSize: 44
    )
    .environmentObject(CartManager())
}
