//
//  LoginView.swift
//  MemoryCards
//
//  Created by VictorZima on 24/02/2022.
//

import SwiftUI

struct LoginView: View {
    
    @State var isLoginMode = false
    @StateObject var user: LoginViewModel
    @State private var isUserCurrentlyLoggedOut = false
    
    let didCompleteLoginProcess: () -> ()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    Picker(selection: $isLoginMode, label: Text("Picker")) {
                        Text("Login")
                            .tag(true)
                        Text("Create Account")
                            .tag(false)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Group {
                        TextField("Email", text: $user.email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        SecureField("Password", text: $user.password)
                    }
                    .padding(12)
                    .background(.white)
                    
                    Button {
                        if isLoginMode {
                            user.loginUser(didCompleteLoginProcess: didCompleteLoginProcess)
                        } else {
                            user.createNewAccount()
                        }
                    } label: {
                        HStack {
                            Spacer()
                            Text(isLoginMode ? "Log In" : "Create Account")
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .font(.system(size: 14, weight: .bold))
                            Spacer()
                        }
                        .background(.blue)
                    }

                }
                .navigationTitle("Create account / log in")
                .background(Color(.init(white: 0, alpha: 0.05)))
                .ignoresSafeArea()
                
                Text("\(user.email)")
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())


    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(user: LoginViewModel(), didCompleteLoginProcess: {
        
        })
    }
}
