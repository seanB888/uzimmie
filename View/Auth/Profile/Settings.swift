//
//  Settings.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 2/1/24.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        VStack {
            Text("Settings")
                .font(.largeTitle)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(.white)
        .foregroundStyle(.black)
    }
}

#Preview {
    Settings()
}
