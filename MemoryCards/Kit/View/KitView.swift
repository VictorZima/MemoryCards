//
//  KitView.swift
//  MemoryCards
//
//  Created by VictorZima on 30/12/2021.
//

import SwiftUI

struct KitView: View {
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .frame(height: 140)
                .foregroundColor(.yellow)
            HStack {
                VStack(alignment: .leading) {
                    Text("My first words in english")
                        .fontWeight(.bold)
                    Spacer()
                    Group {
                        Text("Words: 120")
                        Text("Tags: #sport, #enventer")
                    }
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    
                }
                Spacer()
                Image(systemName: "heart")
            }
            .padding()
            
        }
        .padding([.leading, .trailing])
    }
}
