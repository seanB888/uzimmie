//
//  AuthManager.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 2/10/24.
//

import Foundation

class AuthManager: ObservableObject {
    
    init() {
        // Check persistent storage to determine if the user is logged in
        isUserAuthenticated = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
    }

    @Published var isUserAuthenticated: Bool = false
    
    func logIn() {
        UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
        isUserAuthenticated = true
    }
    
    func logOut() {
        // Perform logout actions
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
        isUserAuthenticated = false
    }
}
