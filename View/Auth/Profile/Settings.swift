//
//  Settings.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 2/1/24.
//

import SwiftUI

struct Settings: View {
    @Environment(\.presentationMode) var goBack
    
    var body: some View {
        VStack {
            // Header
            Header(
                action: {
                    goBack.wrappedValue.dismiss()
                },
                headerTitle: "settings",
                headerSubTitle: "Your Orders",
                headerIcon: "arrow.left",
                fontSize: 44
            )
            
            Text("Settings")
                .font(.headline)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(.white)
        .foregroundStyle(.black)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Settings()
}
