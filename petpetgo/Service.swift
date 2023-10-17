//
//  Service.swift
//  petpetgo
//
//  Created by Zicheng Tan on 10/12/23.
//

import Foundation

struct petService {
    
    func getAccessToken() async throws -> Token{
        
        let endPoint = "https://api.petfinder.com/v2/oauth2/token"
        
        let method = "POST"
        
        guard let url = URL(string: endPoint) else{
            throw AppError.invailURL
        }
        
        //make the HTTP request to get the access token
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method
        urlRequest.httpBody = "grant_type=\(ApiConstants.grantType)&client_id=\(ApiConstants.clientId)&client_secret=\(ApiConstants.clientSecret)".data(using: .utf8)
        
        let (data , httpResponse) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpResponse = httpResponse as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw AppError.invailHttpResponse
        }
  
        let decoder = JSONDecoder()

        decoder.keyDecodingStrategy = .convertFromSnakeCase
                
        let Token =  try decoder.decode(Token.self, from: data)
        
        print(Token)
        return Token
    }
    
    func fetchAnimal (withAccessToken Token : String) async throws {
        let endPoint = "https://api.petfinder.com/v2/animals?type=dog&page=2"
        let method = "GET"
        guard let url = URL(string: endPoint) else {
            throw AppError.invailURL
        }
        print(Token)
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = method
        
        urlRequest.setValue("Bearer \(Token)" , forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { (maybeData: Data?, maybeReponse: URLResponse?,maybeError: Error?) -> Void in
            
            guard let data = maybeData else {
                print("fail to get data")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let Animal = try decoder.decode(allAnimal.self, from: data)
                print(Animal)
            }catch{
                print(error)
            }
            
        }).resume()
                                   
        
        
        
    }
    
}
