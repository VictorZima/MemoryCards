//
//  LoginViewModel.swift
//  MemoryCards
//
//  Created by VictorZima on 24/02/2022.
//

import Foundation
//import Firebase

class LoginViewModel: ObservableObject {
    @Published var isUserCurrentlyLoggedOut = false
    @Published var email = ""
    @Published var password = ""
    

    func createNewAccount() {
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Failed to create user:", err)
                return
            }
            self.isUserCurrentlyLoggedOut.toggle()
        }
        
    }
    
    func loginUser(didCompleteLoginProcess: () -> ()) {
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Failed to login user:", err)
                return
            }
            
            print("Successfully logged in as user: \(result?.user.uid ?? "")")
        }
        didCompleteLoginProcess()
    }
}
