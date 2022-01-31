//
//  CardViewModel.swift
//  MemoryCards
//
//  Created by VictorZima on 24/12/2021.
//

import Combine

final class CardViewModel: ObservableObject, Identifiable {
    //private let cardRepository = CardRepository()
    @Published var studyCard: StudyCardModel
    
    var id = ""
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(studyCard: StudyCardModel) {
        self.studyCard = studyCard
        $studyCard
            .compactMap { $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
}
