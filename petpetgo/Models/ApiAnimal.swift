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
//struct allBreed: Decodable{
//    let breeds:[Breed]
//}
//struct allColor: Decodable{
//    let colors:[color]
//}
struct Animals :Decodable,Identifiable{
    
    let id : Int
    let url: String
    let type, species: String
    let age, gender, size: String
    let coat: String?
    let tags: [String]
    let name: String
    let description : String?
    var photos: [Photo]
    let breeds: Breed?
    let colors: color?

}
struct Photo: Decodable {
    
    var small: String
    var medium: String
    var large: String
    var full: String
    
}
struct Breed : Decodable{
    let primary: String?
    let secondary: String?
    let mixed: Bool
    let unknown: Bool
}

struct color : Decodable {
    let primary: String?
    let secondary: String?
    let tertiary: String?
}

