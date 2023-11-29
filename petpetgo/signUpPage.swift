
import SwiftUI

struct signUpPage: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var userName = ""
    @State private var passWord = ""
    @State private var confirmPassword = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    
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
                            if UserManager.shared.isPasswordValid(password: passWord){
                                UserManager.shared.addUser(newUser: User(firstName: firstName, lastName: lastName, userName: userName, passWord: passWord, isLogIn: false))
                                
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
            }
    func addUser() {
    
        }
}


