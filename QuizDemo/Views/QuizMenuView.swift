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
    
    enum Difficulty: String, CaseIterable {
        case easy = "easy"
        case medium = "medium"
        case hard = "hard"
    }
    
    @State var isSubmitted = false
    
    @State private var selectedDifficulty = Difficulty.easy
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Picker("Select an categorie:",selection: $selectedOption) {
                        ForEach(quizController.categories) { cate in
                            Text(cate.name)
                        }
                    }
                    .pickerStyle(.menu)
                    
                    HStack{
                        Text("Difficulty:")
                        Picker("Select a Difficulty", selection: $selectedDifficulty) {
                            ForEach(Difficulty.allCases, id: \.self) { difficulty in
                                Text(difficulty.rawValue)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal)
                    }
                    Button{
                        isSubmitted = true
                    } label: {
                        Text("Submit")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .frame(width: 900, height:  20, alignment: .center)
                    .padding()
                    
                }
                
            }
        }
        
//    Todo quiz
        
//        .navigationTitle("Quiz")
//        .navigationBarTitleDisplayMode(.inline)
//        .navigationBarItems(trailing: NavigationLink( destination: QuizView(difficulty: selectedDifficulty.rawValue, categorie: quizController.categories[selectedOption])) {
//            Text("Submit")
//        })
     
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        QuizMenuView().environmentObject(QuizController())
            .preferredColorScheme(.dark)
    }
}
