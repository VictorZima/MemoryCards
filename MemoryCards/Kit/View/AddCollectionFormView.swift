//
//  AddCollectionFormView.swift
//  MemoryCards
//
//  Created by VictorZima on 08/01/2022.
//

import SwiftUI

struct AddCollectionFormView: View {
    @State private var title: String = ""
    @State private var description: String = ""
    
    var didAddCollection: (_ collection: KitModel) -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                }
                
                Button("Create Card") {
                    let collection = KitModel(title: title, description: description)
                    didAddCollection(collection)
                }.disabled(title.isEmpty || description.isEmpty).padding()
            }.navigationTitle("New Study Card")
        }
    }
}
