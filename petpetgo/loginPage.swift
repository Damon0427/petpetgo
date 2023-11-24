
import SwiftUI

struct loginPage: View {
    @State private var username = ""
    @State private var password = ""
    @Binding var islogin: Bool
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        VStack {
            Text ("Login    \(Image(systemName:"person"))")
                .font(.title)
                .foregroundStyle(Color.black)
                .padding()
            TextField("Username", text: $username)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 2))
                .padding(.horizontal)

            SecureField("Password", text: $password)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 2))
                .padding(.horizontal)
            Button {
                
                if(UserManager.shared.isValidLogin(username: username, password: password)){
                    print("login success")
                    //set back to the user page if it is login
                    islogin = true
                }else {
                    showAlert.toggle()
                    alertMessage = "Unmatch username or password to our database"
                }
            } label: {
                Text("SIGN IN")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.yellow.opacity(0.6))
                .foregroundColor(.white)
                .cornerRadius(20)
                .padding()
            }
                    
            Divider()
            
            NavigationLink(destination: signUpPage()){
                    Text("Don't have a account? Sign up now!")
                    .foregroundColor(.blue)
                        }
            .padding()
            

            }
        
        .padding()
        .shadow(radius: 5)
        .alert(isPresented: $showAlert) {
            
            Alert(title: Text("Fail to login"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                        }
    }
    
}

