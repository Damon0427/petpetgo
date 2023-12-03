//
//  EditInfoPage.swift
//  petpetgo
//
//  Created by Jiaming Zhao on 12/2/23.
//

import SwiftUI



struct EditInfoPage: View {
    @StateObject var vm = coreDataviewModel()
    @State private var newFirstName = ""
    @State private var newPassword = ""
    @State private var newLastName = ""
    
    
    
    var body: some View {
        //use to check the user information
        ForEach(vm.saveEntities){
            entity in
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                VStack{
                    
                    
                    Text("UserName: \(entity.username ?? "No name")")
//                    Text("Password: \(entity.password ?? "No password")")
                    
                    Text("FristName: \(entity.firstname ?? "No name")")
                    Text("LastName: \(entity.lastname ?? "No name")")
                    
                    TextField("New First Name", text: $newFirstName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button("Update First Name") {
                        updateFirstName(entity: entity)
                    }
                    
                    TextField("New Last Name", text: $newLastName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button("Update Last Name") {
                        updateLastName(entity: entity)
                    }
                    
                    TextField("New passowrd", text: $newPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button("Update Password") {
                        updatePassword(entity: entity)
                    }
                }
            }
        }
    }
    
    func updateFirstName(entity: UserEntity) {
        // Update the first name if it's not empty
        if !newFirstName.isEmpty {
            vm.updateFirstName(entity: entity, newFirstName: newFirstName)
            self.newFirstName = ""
        }
    }
    
    func updateLastName(entity: UserEntity) {
        // Update the last name if it's not empty
        if !newLastName.isEmpty {
            vm.updateLastName(entity: entity, newLastName: newLastName)
            self.newLastName = ""
        }
    }
    func updatePassword(entity: UserEntity) {
        // Update the password if it's not empty
        if !newPassword.isEmpty {
            vm.updatePassword(entity: entity, newPassword: newPassword)
            self.newPassword = ""
        }
    }
    
    
    
}



struct EditInfoPage_Previews: PreviewProvider {
    static var previews: some View {
        EditInfoPage()
    }
}
