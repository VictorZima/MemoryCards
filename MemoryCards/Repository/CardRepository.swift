//
//  CardRepository.swift
//  MemoryCards
//
//  Created by VictorZima on 20/12/2021.
//

import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

final class CardRepository: ObservableObject {
    private let path = "memoryCards"
    private let store = Firestore.firestore()
    @Published var studyCards: [StudyCard] = []
    
    init() {
        get()
    }
    
    func get() {
        store.collection(path).addSnapshotListener { (snapshort, error) in
            if let error = error {
                print(error)
                return
            }
            self.studyCards = snapshort?.documents.compactMap{
                try? $0.data(as: StudyCard.self)
            } ?? []
        }
    }
    
    func add(_ studyCard: StudyCard) {
        do {
            _ = try store.collection(path).addDocument(from: studyCard)
        } catch {
            fatalError("Adding a study card failed")
        }
    }
    
    func remove(_ studyCard: StudyCard) {
        guard let documentId = studyCard.id else { return }
        store.collection(path).document(documentId).delete { error in
            if let error = error {
                print("Unable to remove the card: \(error.localizedDescription)")
            }
        }
    }
    
    func update(_ studyCard: StudyCard) {
        guard let documentId = studyCard.id else { return }
        do {
            try store.collection(path).document(documentId).setData(from: studyCard)
        } catch {
            fatalError("Adding a study card failed")
        }
    }
}
