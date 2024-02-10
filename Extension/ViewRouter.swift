//
//  ViewRouter.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 2/7/24.
//

import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .home
}

enum Page {
    case home
    case cart
    // other pages as needed
}
