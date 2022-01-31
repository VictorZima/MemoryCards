//
//  CollectionListViewModel.swift
//  MemoryCards
//
//  Created by VictorZima on 08/01/2022.
//

import Combine

final class CollectionListViewModel: ObservableObject {
    @Published var collectionRepository = CollectionRepository()
    @Published var collectionViewModels: [CollectionViewModel] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        collectionRepository.$collections
            .map { collections in
                collections.map(CollectionViewModel.init)
                
            }
            .assign(to: \.collectionViewModels, on: self)
            .store(in: &cancellables)
    }
    
    func add(_ collection: CollectionModel) {
        collectionRepository.add(collection)
    }
    
    func remove(_ collection: CollectionModel) {
        collectionRepository.remove(collection)
    }
    
    func update(_ collection: CollectionModel) {
        collectionRepository.update(collection)
    }
    
}
