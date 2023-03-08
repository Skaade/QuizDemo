//
//  Categories.swift
//  QuizDemo
//
//  Created by dmu mac 25 on 08/03/2023.
//

import Foundation

struct Categorie: Codable, Identifiable {
    let id: Int
    let name: String
    
    init(_ id: Int, _ name: String) {
        self.id = id
        self.name = name
    }
}
