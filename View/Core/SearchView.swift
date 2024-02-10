//
//  SearchView.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 2/9/24.
//

import SwiftUI

struct SearchView: View {
    @Environment(\.presentationMode) var goBackFromWhichYouCame
    
    var body: some View {
        VStack {
            // MARK: - Header
            Header(
                action: {
                    goBackFromWhichYouCame.wrappedValue.dismiss()
                },
                headerTitle: "search",
                headerSubTitle: "Search our Inventory",
                headerIcon: "arrow.left",
                fontSize: 50
            )
            .foregroundStyle(.black)

            Text("Inventory")
                .font(.largeTitle)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(.white)
        .foregroundStyle(.black)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SearchView()
}
