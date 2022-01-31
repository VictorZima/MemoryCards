//
//  CollectionViewModel.swift
//  MemoryCards
//
//  Created by VictorZima on 08/01/2022.
//

import Foundation

import Combine

final class CollectionViewModel: ObservableObject, Identifiable {
    //private let collectionRepository = CollectionRepository()
    @Published var collection: CollectionModel
    
    var id = ""
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(collection: CollectionModel) {
        self.collection = collection
        $collection
            .compactMap { $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
        
    }
}
