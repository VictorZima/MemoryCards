//
//  FormView.swift
//  MemoryCards
//
//  Created by VictorZima on 24/12/2021.
//

import SwiftUI

struct FormView: View {
    @State private var question: String = ""
    @State private var answer: String = ""
    
    var didAddCard: (_ studyCard: StudyCardModel) -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Question", text: $question)
                    TextField("Answer", text: $answer)
                }
                
                Button("Create Card") {
                    let card = StudyCardModel(question: question, answer: answer)
                    didAddCard(card)
                }.disabled(question.isEmpty || answer.isEmpty).padding()
            }.navigationTitle("New Study Card")
        }
    }
}
