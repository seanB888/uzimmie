//
//  Home.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 1/25/24.
//

import SwiftUI

struct Home: View {
    @State private var selectedCategory: String = "All"
    @State private var navigateToView = false
    
    var body: some View {
        NavigationStack {
            VStack {
                // MARK: -Header
                Header(
                    action: {
                        navigateToView = true
                    },
                    headerTitle: "uzimmie",
                    headerSubTitle: "From Bull Bay to di Flippin World!",
                    headerIcon: "line.3.horizontal",
                    fontSize: 44
                )
                .padding(.bottom, 20)
                
                // MARK: - Category List
                CategoryNavBar(selectedCategory: $selectedCategory)
                    .padding(.leading, 10)
                
                // MARK: - Collection view
                // CollectionView()
                Spacer()
            }
            .foregroundStyle(.black)
            .background(.white)
        }
    }
}

#Preview {
    Home()
}
