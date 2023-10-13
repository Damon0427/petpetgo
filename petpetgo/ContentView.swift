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
            service.getAccessToken()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
