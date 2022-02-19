//
//  KitViewModel.swift
//  MemoryCards
//
//  Created by VictorZima on 08/01/2022.
//

import Foundation

import Combine

final class KitViewModel: ObservableObject, Identifiable {
    //private let collectionRepository = CollectionRepository()
    @Published var collection: KitModel
    
    var id = ""
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(collection: KitModel) {
        self.collection = collection
        $collection
            .compactMap { $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
        
    }
}
