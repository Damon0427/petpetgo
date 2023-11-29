//
//  petpetgoApp.swift
//  petpetgo
//
//  Created by Zicheng Tan on 10/12/23.
//

import SwiftUI

@main


struct petpetgoApp: App {
    @StateObject private var userViewModel = UserViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userViewModel)
        }
    }
}
