//
//  searchPage.swift
//  petpetgo
//
//  Created by Zicheng Tan on 11/9/23.
//

import SwiftUI

struct searchPage: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
            Text("search page")
        }
        
    }
}

//#Preview {
//    searchPage()
//}

struct Previews_searchPage_Previews: PreviewProvider {
    static var previews: some View {
        searchPage()
    }
}
