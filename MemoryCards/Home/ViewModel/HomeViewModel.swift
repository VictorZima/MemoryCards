//
//  HomeViewModel.swift
//  MemoryCards
//
//  Created by VictorZima on 28/02/2022.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var isUserCurrentlyLoggedOut = false
    
    init() {
        DispatchQueue.main.async {
            self.isUserCurrentlyLoggedOut = FirebaseManager.shared.auth.currentUser?.uid == nil
        }
    }
    
    func handleSignOut() {
        isUserCurrentlyLoggedOut.toggle()
        try? FirebaseManager.shared.auth.signOut()
    }
}
