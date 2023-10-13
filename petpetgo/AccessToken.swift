//
//  AccessToken.swift
//  petpetgo
//
//  Created by Zicheng Tan on 10/12/23.
//

import Foundation

struct Token :Decodable{
    let tokenType : String
    let expiresIn : Int
    let accessToken : String
}
