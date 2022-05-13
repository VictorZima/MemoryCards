//
//  KitListViewModel.swift
//  MemoryCards
//
//  Created by VictorZima on 25/02/2022.
//

import SwiftUI

class KitListViewModel: ObservableObject {
    
    @Published var kits = [KitModel]()
    
    init() {
        fetchKits()
    }
    
    func fetchKits() {
        //kits = KitModel(uid: "111", title: "111")
    }

}
