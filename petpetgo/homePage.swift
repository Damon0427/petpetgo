//
//  homePage.swift
//  petpetgo
//
//  Created by Zicheng Tan on 11/9/23.
//

import SwiftUI

struct homePage: View {
    @Binding var selectionTap: Int


    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
            Text("Home Page")
            
            
            
        }
    }
}

//#Preview {
//    homePage(selectionTap: .constant(1))
//}


struct Previews_homePage_Previews: PreviewProvider {
    static var previews: some View {
        homePage(selectionTap: .constant(1))
    }
}
