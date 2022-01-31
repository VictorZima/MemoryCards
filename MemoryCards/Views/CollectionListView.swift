//
//  CollectionListView.swift
//  MemoryCards
//
//  Created by VictorZima on 30/12/2021.
//

import SwiftUI

struct CollectionListView: View {
    
    @ObservedObject var collectionListViewModel: CollectionListViewModel
    @State private var showingForm = false
    @State private var showPassed = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(collectionListViewModel.collectionViewModels.filter {
                        $0.collection.passed == showPassed }) { collectionVM in
                            
                            NavigationLink(destination: CardListView(cardListViewModel: CardListViewModel())) {
                                CollectionView(collectionViewModel: collectionVM)
                            }
                        }
                        .onDelete(perform: delete)
                        .listRowSeparator(.hidden)
                    
                }
                .listStyle(InsetListStyle())
                .navigationTitle("Collection Cards")
                
                Button(action: {
                    showingForm = true
                }) {
                    Circle()
                        .fill(Color.green)
                        .frame(height: 60)
                        .overlay(Image(systemName: "plus").foregroundColor(.white))
                }.sheet(isPresented: $showingForm) {
                    AddCollectionFormView { (collection) in
                        collectionListViewModel.add(collection)
                        showingForm = false
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
        
    private func delete(at offsets: IndexSet) {
        offsets.map { collectionListViewModel.collectionViewModels[$0].collection
                
        }.forEach(collectionListViewModel.remove)
    }
}

struct CollectionListView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionListView(collectionListViewModel: CollectionListViewModel())
    }
}
