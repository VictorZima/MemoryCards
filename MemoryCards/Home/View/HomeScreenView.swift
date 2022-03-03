//
//  HomeScreenView.swift
//  MemoryCards
//
//  Created by VictorZima on 25/12/2021.
//

import SwiftUI

struct HomeScreenView: View {
    @ObservedObject private var vm = HomeViewModel()
    
    var body: some View {
        VStack {

            Text("Home Screen")
            Spacer()
            Button {
                vm.handleSignOut()
            } label: {
                Image(systemName: "gear")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color(.label))
            }
            
        }
        TabView {
            Text("First")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
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

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}

