//
//  KitListViewModel.swift
//  MemoryCards
//
//  Created by VictorZima on 08/01/2022.
//

import Combine

final class KitListViewModel: ObservableObject {
    @Published var collectionRepository = CollectionRepository()
    @Published var collectionViewModels: [KitViewModel] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        collectionRepository.$collections
            .map { collections in
                collections.map(KitViewModel.init)
                
            }
            .assign(to: \.collectionViewModels, on: self)
            .store(in: &cancellables)
    }
    
    func add(_ collection: KitModel) {
        collectionRepository.add(collection)
    }
    
    func remove(_ collection: KitModel) {
        collectionRepository.remove(collection)
    }
    
    func update(_ collection: KitModel) {
        collectionRepository.update(collection)
    }
    
}
