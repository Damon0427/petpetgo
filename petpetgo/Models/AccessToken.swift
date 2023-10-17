//
//  AccessToken.swift
//  petpetgo
//
//  Created by Zicheng Tan on 10/12/23.
//

import Foundation


struct ApiToken {
    let tokenType : String
    let expiresIn : Int
    let accessToken : String
    init(tokenType: String, expiresIn: Int, accessToken: String) {
        self.tokenType = tokenType
        self.expiresIn = expiresIn
        self.accessToken = accessToken
    }
    init(token: Token ){
        self.tokenType = token.tokenType
        self.accessToken = token.accessToken
        self.expiresIn = token.expiresIn
    }
}

struct Token :Decodable{
    let tokenType : String
    let expiresIn : Int
    let accessToken : String
}
