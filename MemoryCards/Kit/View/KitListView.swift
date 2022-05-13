//
//  KitListView.swift
//  MemoryCards
//
//  Created by VictorZima on 30/12/2021.
//

import SwiftUI

struct KitListView: View {
    @StateObject var kitList = KitListViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack() {
                    ForEach (1..<6) { kit in
                        KitView()
                        //Text(kitList.title)
                    }
                }
                .navigationTitle("My Collections")
                .toolbar {
                    Button {
                        
                    }
                    label: {
                        Text("+")
                    }
                }
            }
        }

    }
}

struct CollectionListView_Previews: PreviewProvider {
    
    static var previews: some View {
        KitListView()
    }
}
