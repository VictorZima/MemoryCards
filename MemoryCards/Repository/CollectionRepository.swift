//
//  CollectionRepository.swift
//  MemoryCards
//
//  Created by VictorZima on 08/01/2022.
//

import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

final class CollectionRepository: ObservableObject {
    private let path = "memoryCards"
    private let store = Firestore.firestore()
    @Published var collections: [KitModel] = []
    
    init() {
        get()
    }
    
    func get() {
        store.collection(path).addSnapshotListener { (snapshort, error) in
            if let error = error {
                print(error)
                return
            }
            self.collections = snapshort?.documents.compactMap{
                try? $0.data(as: KitModel.self)
            } ?? []
        }
    }
    
    func add(_ collection: KitModel) {
        do {
            _ = try store.collection(path).addDocument(from: collection)
        } catch {
            fatalError("Adding a study card failed")
        }
    }
    
    func remove(_ collection: KitModel) {
        guard let documentId = collection.id else { return }
        store.collection(path).document(documentId).delete { error in
            if let error = error {
                print("Unable to remove the card: \(error.localizedDescription)")
            }
        }
    }
    
    func update(_ collection: KitModel) {
        guard let documentId = collection.id else { return }
        do {
            try store.collection(path).document(documentId).setData(from: collection)
        } catch {
            fatalError("Adding a study card failed")
        }
    }
}

