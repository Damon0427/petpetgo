//
//  Constants.swift
//  petpetgo
//
//  Created by Zicheng Tan on 10/12/23.
//

import Foundation


enum AppError : Error {
    case invailURL
    case invailToken
    case invailRequest
    
}

class ApiConstants {
    static let clientId = "H5Rz5LlYbnxcJ3eDVzMHbXhUs7XWL5BhL5SpFaL8i6GxCICDrN"
    static let clientSecret = "R2N6v0uRfp3wSWZ30hmrVRlEforWhiORzCw2keZD"
    static let grantType = "client_credentials"
    
}
