//
//  CardListViewModel.swift
//  MemoryCards
//
//  Created by VictorZima on 22/12/2021.
//

import Combine

final class CardListViewModel: ObservableObject {
    @Published var cardRepository = CardRepository()
    @Published var cardViewModels: [CardViewModel] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        cardRepository.$studyCards
            .map { studyCards in
                studyCards.map(CardViewModel.init)
                
            }
            .assign(to: \.cardViewModels, on: self)
            .store(in: &cancellables)
    }
    
    func add(_ studyCard: StudyCardModel) {
        cardRepository.add(studyCard)
    }
    
    func remove(_ studyCard: StudyCardModel) {
        cardRepository.remove(studyCard)
    }
    
    func update(_ studyCard: StudyCardModel) {
        cardRepository.update(studyCard)
    }
    
}
