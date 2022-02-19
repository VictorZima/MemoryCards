//
//  MemoryCardsApp.swift
//  MemoryCards
//
//  Created by VictorZima on 20/12/2021.
//

import SwiftUI
import Firebase

@main
struct MemoryCardsApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            HomeScreenView()
        }
    }
}
