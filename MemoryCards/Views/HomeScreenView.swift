//
//  HomeScreenView.swift
//  MemoryCards
//
//  Created by VictorZima on 25/12/2021.
//

import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        TabView {
            KitListView(kitListViewModel: KitListViewModel())
            .tabItem {
                Image(systemName: "lanyardcard")
                Text("Collections")
            }
            
            AchievementsView()
            .tabItem {
                Image(systemName: "star.leadinghalf.filled")
                Text("Achievements")
            }
            
            ProfileView()
            .tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
