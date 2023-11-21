//
//  userPage.swift
//  petpetgo
//
//  Created by Zicheng Tan on 11/5/23.
//

import SwiftUI

struct userPage: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
            Text("Here is user page")
        }
        
    }
}

//#Preview {
//    userPage()
//}


struct Previews_userPage_Previews: PreviewProvider {
    static var previews: some View {
        userPage()
    }
}
