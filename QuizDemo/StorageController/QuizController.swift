//
//  QuizController.swift
//  QuizDemo
//
//  Created by dmu mac 25 on 08/03/2023.
//

import Foundation

//QuizController fordi vi er gået fra MVVM til MV

class QuizController: ObservableObject{
    @Published var categories: [Category] = []
    @Published var questions: [Question] = []

    
    init(){
        fetchCategories()
    }
    
    func fetchCategories(){
        
        Task(priority: .background){
            guard let url = URL(string: "https://opentdb.com/api_category.php") else {return}
            guard let rawCategorieData = await NetworkService.getData(url) else {return}
            let decoder = JSONDecoder()
            do{
                let result = try decoder.decode(CategorieList.self, from: rawCategorieData)
                categories = result.results
            } catch {
                fatalError("JOEMAMA_")
            }
        }
    }
    
    func fetchQuitions(categoryNr: String, difficulty: String){
        Task(priority: .background){
            guard let url = URL(string: "https://opentdb.com/api.php?amount=10&\(categoryNr)=10&difficulty=\(difficulty)") else {return}
            guard let rawCategorieData = await NetworkService.getData(url) else {return}
            let decoder = JSONDecoder()
            do{
                let result = try decoder.decode(CategorieList.self, from: rawCategorieData)
                categories = result.results
            } catch {
                fatalError("JOEMAMA_")
            }
        }
    }
    

    
}
