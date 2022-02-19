//
//  KitListView.swift
//  MemoryCards
//
//  Created by VictorZima on 30/12/2021.
//

import SwiftUI

struct KitListView: View {
    
    @ObservedObject var kitListViewModel: KitListViewModel
    @State private var showingForm = false
    @State private var showPassed = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(kitListViewModel.collectionViewModels.filter {
                        $0.collection.passed == showPassed }) { collectionVM in
                            
                            NavigationLink(destination: CardListView(cardListViewModel: CardListViewModel())) {
                                KitView(collectionViewModel: collectionVM)
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
                        kitListViewModel.add(collection)
                        showingForm = false
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
        
    private func delete(at offsets: IndexSet) {
        offsets.map { kitListViewModel.collectionViewModels[$0].collection
                
        }.forEach(kitListViewModel.remove)
    }
}

struct CollectionListView_Previews: PreviewProvider {
    static var previews: some View {
        KitListView(kitListViewModel: KitListViewModel())
    }
}
