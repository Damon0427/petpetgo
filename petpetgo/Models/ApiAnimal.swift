//
//  ApiAnimal.swift
//  petpetgo
//
//  Created by Zicheng Tan on 10/15/23.
//

import Foundation

struct petpetgo {
    let id : Int
    let url: String
    let type, species: String
    let breeds: Breed?
    let colors: color?
    let name, description, photos : String
    
    init(id: Int, url: String, type: String, species: String, breeds: Breed?, colors: color?, name: String, description: String, photos: String) {
        self.id = id
        self.url = url
        self.type = type
        self.species = species
        self.breeds = breeds
        self.colors = colors
        self.name = name
        self.description = description
        self.photos = photos
    }
}
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

