import SwiftUI

struct EditInfoPage: View {
    @StateObject var vm = coreDataviewModel()
    @State private var newFirstName = ""
    @State private var newPassword = ""
    @State private var newLastName = ""

    let userName: String

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack {
                if let userEntity = vm.saveEntities.first(where: { $0.username == userName }) {
                    Text("UserName: \(userEntity.username ?? "No name")").bold()
                    Text("FristName: \(userEntity.firstname ?? "No name")").bold()
                    Text("LastName: \(userEntity.lastname ?? "No name")").bold()

                    TextField("New First Name", text: $newFirstName)
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .padding()

                    Button("Update First Name") {
                        updateFirstName(entity: userEntity)
                        vm.refreshUserData()
                    }
                    .bold()
                    .cornerRadius(10)
                    .shadow(radius: 10)

                    TextField("New Last Name", text: $newLastName)
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .padding()

                    Button("Update Last Name") {
                        updateLastName(entity: userEntity)
                        vm.refreshUserData()
                        
                    }
                    .bold()
                    .cornerRadius(10)
                    .shadow(radius: 10)

                    TextField("New passowrd", text: $newPassword)
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .padding()

                    Button("Update Password") {
                        updatePassword(entity: userEntity)
                        vm.refreshUserData()
                    }
                    .bold()
                    .cornerRadius(10)
                    .shadow(radius: 10)
                } else {
                    Text("User not found")
                }
            }
        }
    }

    func updateFirstName(entity: UserEntity) {
        if !newFirstName.isEmpty {
            vm.updateFirstName(entity: entity, newFirstName: newFirstName)
            self.newFirstName = ""
        }
    }

    func updateLastName(entity: UserEntity) {
        if !newLastName.isEmpty {
            vm.updateLastName(entity: entity, newLastName: newLastName)
            self.newLastName = ""
        }
    }

    func updatePassword(entity: UserEntity) {
        if !newPassword.isEmpty {
            vm.updatePassword(entity: entity, newPassword: newPassword)
            self.newPassword = ""
        }
    }
}

struct EditInfoPage_Previews: PreviewProvider {
    static var previews: some View {
        // For preview purposes, you can create a sample userName
        let sampleUserName = "SampleUser"

        return EditInfoPage(userName: sampleUserName)
    }
}
