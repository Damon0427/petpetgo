//
//  ContentView.swift
//  petpetgo
//
//  Created by Zicheng Tan on 10/12/23.
//

import SwiftUI

struct ContentView: View {
    
   let service = petService()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .onAppear{
            Task{
            do{
            
               let token = try await service.getAccessToken()
               let accessToken = token.accessToken
            
                try await service.fetchAnimal(withAccessToken: accessToken)
                
                }catch {
                    print("123")
                }
                
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
