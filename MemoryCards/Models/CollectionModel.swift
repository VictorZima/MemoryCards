//
//  CollectionModel.swift
//  MemoryCards
//
//  Created by VictorZima on 30/12/2021.
//

import FirebaseFirestoreSwift


struct CollectionModel: Identifiable, Codable {
    @DocumentID var id: String?
    var title: String
    var description: String
    var amount: Int
}

