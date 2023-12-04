
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
                        .bold()
//                    Text("Password: \(entity.password ?? "No password")")
                    
                    Text("FristName: \(entity.firstname ?? "No name")")
                        .bold()
                    Text("LastName: \(entity.lastname ?? "No name")")
                        .bold()
                    
                    TextField("New First Name", text: $newFirstName)
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .padding()
                    
                    Button("Update First Name") {
                        updateFirstName(entity: entity)
                    }.bold()
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
                        updateLastName(entity: entity)
                    }.bold()
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
                        updatePassword(entity: entity)
                    }.bold()
                        .cornerRadius(10)
                        .shadow(radius: 10)
                    
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
