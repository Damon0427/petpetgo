//
//  UserViewModel.swift
//  petpetgo
//
//  Created by Jiaming Zhao on 11/29/23.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var currentUser: User?

    func setUser(user: User) {
        currentUser = user
    }
}
