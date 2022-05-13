//
//  FirebaseManager.swift
//  MemoryCards
//
//  Created by VictorZima on 24/02/2022.
//

import Foundation
import Firebase

class FirebaseManager: NSObject {
    let auth: Auth
    let firestore: Firestore
    
    static let shared = FirebaseManager()
    
    override init() {
        FirebaseApp.configure()
        
        auth = Auth.auth()
        firestore = Firestore.firestore()
        
        super.init()
    }
}
