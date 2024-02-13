//
//  AuthManager.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 2/10/24.
//


import Firebase
import FirebaseAuth

class AuthManager: ObservableObject {
    @Published var isUserAuthenticated: Bool = false

    init() {
        // Automatically determine if the user is logged in by checking the Auth state
        Auth.auth().addStateDidChangeListener { auth, user in
            self.isUserAuthenticated = user != nil
        }
    }
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            if let user = authResult?.user {
                print("User signed in: \(user)")
                strongSelf.isUserAuthenticated = true
            } else if let error = error {
                print("Error signing in: \(error.localizedDescription)")
            }
        }
    }
    
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            if let user = authResult?.user {
                print("User signed up: \(user)")
                strongSelf.isUserAuthenticated = true
            } else if let error = error {
                print("Error signing up: \(error.localizedDescription)")
            }
        }
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
            isUserAuthenticated = false
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
