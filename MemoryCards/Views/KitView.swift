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
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.purple)
                .frame(height: 100)
            Text("qqq")
        }
        .padding()
       
    }
}

struct KitView_Previews: PreviewProvider {
    static var previews: some View {
        KitView()
    }
}
