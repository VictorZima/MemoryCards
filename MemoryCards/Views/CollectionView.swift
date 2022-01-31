//
//  CollectionView.swift
//  MemoryCards
//
//  Created by VictorZima on 30/12/2021.
//

import SwiftUI

struct CollectionView: View {
    var collectionViewModel: CollectionViewModel
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.purple)
                .frame(height: 100)
            VStack(alignment: .leading) {
                Text(collectionViewModel.collection.title)
                    .foregroundColor(Color.white)
                    .font(.custom("Avenir", size: 20))
                Text(collectionViewModel.collection.description)
                    .foregroundColor(Color.white)
                    .font(.custom("Avenir", size: 16))
                
                Text(collectionViewModel.collection.id!)
                    .foregroundColor(Color.white)
                    .font(.custom("Avenir", size: 12))
            }
            .padding()
            
        }
    }
}
