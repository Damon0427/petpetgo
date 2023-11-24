//
//  User.swift
//  petpetgo
//
//  Created by Chlora Liu on 11/23/23.
//

import Foundation


struct User {
    let firstName: String
    let lastName: String
    let userName: String
    let passWord: String
    var isLogIn: Bool
    
    mutating func setLoggedIn() {
            isLogIn = true
        }
}

class UserManager: ObservableObject {
    
    //make a Singleton， so different views will access the same class.
    static let shared = UserManager()

    @Published var users: [User] = []

    func addUser(newUser: User) {
        users.append(newUser)
    }

    func isPasswordValid(password: String) -> Bool {
        // minimum 8 characters, at least one lowercase, one uppercase, and one number
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*[0-9]).{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }
    func isValidLogin(username: String, password: String) -> Bool {
        return users.contains { user in
            user.userName == username && user.passWord == password
        }
    }
}


