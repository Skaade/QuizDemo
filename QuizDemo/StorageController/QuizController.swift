//
//  QuizController.swift
//  QuizDemo
//
//  Created by dmu mac 25 on 08/03/2023.
//

import Foundation

class QuizController: ObservableObject{
    @Published var categories: [Categorie] = []
    
    
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
    

    
}
