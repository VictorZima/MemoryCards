//
//  KitListViewModel.swift
//  MemoryCards
//
//  Created by VictorZima on 25/02/2022.
//

import Foundation

class KitListViewModel {
    
    init() {
        fetchCurrentUser()
    }
    
    private func fetchCurrentUser() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            return
        }
        
    }
}
