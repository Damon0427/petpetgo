//
//  Service.swift
//  petpetgo
//
//  Created by Zicheng Tan on 10/12/23.
//

import Foundation

struct petService {
    
    func getAccessToken() {
        
        let endPoint = "https://api.petfinder.com/v2/oauth2/token"
        
        let method = "POST"
        
        guard let url = URL(string: endPoint) else{
//            throw AppError.invailURL
            return
        }
        
        //make the HTTP request to get the access token
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method
        urlRequest.httpBody = "grant_type=client_credentials&client_id=\(ApiConstants.clientId)&client_secret=\(ApiConstants.clientSecret)".data(using: .utf8)
        
        URLSession.shared.dataTask(with: urlRequest, completionHandler: {(maybeData: Data?, maybeResponse: URLResponse?, maybeError: Error?)-> Void in
            guard let data = maybeData else{
                
                print("There is no data")
                return
            }
            
            let decoder = JSONDecoder()
            
            do{
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let elements =  try decoder.decode(Token.self, from: data)
                
                
                print(elements)
                
            }catch{
                print(AppError.invailToken)
            }
        }).resume()
        
    }
    
}
