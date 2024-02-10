//
//  ProfileIconButton.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 1/31/24.
//

import SwiftUI

struct ProfileIconButton: View {
    var imageIcon: String
    var titleText: String
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageIcon)
                .imageScale(.large)
            Text(titleText)
                .font(.caption)
        }
        .padding()
        .frame(width: 100, height: 100)
        .foregroundStyle(.black)
    }
}

#Preview {
    ProfileIconButton(imageIcon: "gear", titleText: "Settings")
}
