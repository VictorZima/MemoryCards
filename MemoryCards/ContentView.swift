//
//  ContentView.swift
//  MemoryCards
//
//  Created by VictorZima on 03/03/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var vm = ContentViewModel()
    
    var body: some View {
        Button {
            vm.handleSignOut()
        } label: {
            Image(systemName: "gear")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color(.label))
        }
        
        TabView {
            HomeScreenView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            KitListView()
                .tabItem {
                    Image(systemName: "doc.plaintext")
                    Text("Kits")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Profile")
                }
        }
        
        .fullScreenCover(isPresented: $vm.isUserCurrentlyLoggedOut, onDismiss: nil) {
            LoginView(user: LoginViewModel(), didCompleteLoginProcess: {
                self.vm.isUserCurrentlyLoggedOut = false
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
