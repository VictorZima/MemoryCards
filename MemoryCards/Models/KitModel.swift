//
//  KitModel.swift
//  MemoryCards
//
//  Created by VictorZima on 30/12/2021.
//

import FirebaseFirestoreSwift

struct KitModel: Identifiable, Codable {
    @DocumentID var id: String?
    var title: String
    var description: String
    var amount: Int = 0
    var passed: Bool = false
}

