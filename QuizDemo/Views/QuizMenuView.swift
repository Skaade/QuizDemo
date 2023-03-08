//
//  ContentView.swift
//  QuizDemo
//
//  Created by dmu mac 25 on 08/03/2023.
//

import SwiftUI

struct QuizMenuView: View {
    
    @EnvironmentObject var quizController: QuizController
    
    @State private var selectedOption = 0
    
    var body: some View {
        Form{
            Section{
                Picker("Select an categorie",selection: $selectedOption) {
                    ForEach(quizController.categories) { cate in
                        Text(cate.name)
                    }
                }
            }
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        QuizMenuView().environmentObject(QuizController())
            .preferredColorScheme(.dark)
    }
}
