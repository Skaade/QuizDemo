//
//  CategorieList.swift
//  QuizDemo
//
//  Created by dmu mac 25 on 08/03/2023.
//

import Foundation

struct CategorieList: Codable{
    let results: [Category]
    
    enum CodingKeys: String, CodingKey {
            case results = "trivia_categories"
        }
}
