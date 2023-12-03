
import SwiftUI

struct signUpPage: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var userName = ""
    @State private var passWord = ""
    @State private var confirmPassword = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @StateObject var vm = coreDataviewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            
                LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
            VStack{
                
                Text("Register a account")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                TextField("First name", text: $firstName)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.black.opacity(0.7), lineWidth: 2))
                            .padding(.horizontal)
                TextField("Last name", text: $lastName)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.black.opacity(0.7), lineWidth: 2))
                            .padding(.horizontal)
                TextField("User name", text: $userName)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.black.opacity(0.7), lineWidth: 2))
                            .padding(.horizontal)

                SecureField("Password", text: $passWord)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.black.opacity(0.7), lineWidth: 2))
                            .padding(.horizontal)

                SecureField("Confirm Password", text: $confirmPassword)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.black.opacity(0.7), lineWidth: 2))
                            .padding(.horizontal)
                        
                        Button(action: {
                            //check the password, if it is valid, add it into array
                            
                            print("register")
                            if vm.isPasswordValid(password: passWord){
                                
                                vm.addUser(userName: userName, passWord: passWord, firstName: firstName, lastName: lastName)
                                
                                print("Register success")
                                
                                presentationMode.wrappedValue.dismiss()
                                
                            }else {
                                
                                showAlert.toggle()
                                alertMessage = "Your password must be at least 8 characters long and contain one letter and one number"
                                print("Password validation failed")

                            }
                        }) {
                            Text("Register")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.yellow.opacity(0.6))
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .padding(.horizontal)
                        }
                        .disabled(confirmPassword != passWord)
                

                    }
                    .padding()
                .shadow(radius: 5)
        }
        .alert(isPresented: $showAlert) {
                    Alert(title: Text("Fail to register"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
        
    //use to check the core data for registered user
        List{
            ForEach(vm.saveEntities){
                entity in
                
                HStack{
                    Text("user:")
                    Text(entity.username ?? "No name")
                    Text("password:")
                    Text(entity.password ?? "No password")
                }

                HStack{
                    Text("FN:")
                    Text(entity.firstname ?? "No first name")
                    Text("LN:")
                    Text(entity.lastname ?? "No last name")
                }
            }
            .onDelete(perform: vm.deleteUser)

        }
        
        
            }

}
//#Preview {
//    signUpPage()
//}



struct Previews_signUpPage_Previews: PreviewProvider {
    static var previews: some View {
        signUpPage()
    }
}
