//
//  ApiAnimal.swift
//  petpetgo
//
//  Created by Zicheng Tan on 10/15/23.
//

import Foundation

struct allAnimal: Decodable{
    let animals:[Animals]
}
struct Animals :Decodable{
    
    let id : Int
    let url: String
    let type, species: String?
    let age, gender, size: String?
    let coat: String?
    let tags: [String]?
    let name, description : String?
    
}
struct Breed : Decodable{
    let primary: String
    let secondary: String?
    let mixed: Bool
    let unknown: Bool
}

struct color : Decodable {
    let primary: String
    let secondary: String?
    let tertiary: String?
}

