

import SwiftUI

struct ContactUsView: View {
    @Binding var isPresented: Bool
    @State private var userMessage = ""
    @State private var userEmail = ""

    var body: some View {
        NavigationView {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                VStack (alignment:.leading){
                    
                    Divider()
                    Text("Please enter your email:")
                        .padding(2)
                        .bold()
                    
                    TextField("Enter your email", text: $userEmail)
                        .frame(height: 30)
                        .background(Color(white: 1))
                        .padding(2)
                    
                    
                    Text("Please enter your message:")
                        .bold()
                    Text("If you want to adopte a pet, please leave your message with pet ID number")
                        .padding(2)
                        
                    
                    TextEditor(text: $userMessage)
                        .frame(height: 100)
                        .cornerRadius(20)
                        .padding(2)
                    
                    Button("Send") {
                        print("User message: \(userMessage)")
                        isPresented = false
                        
                    }
                    .frame(width: 50,height: 20)
                    .cornerRadius(6)
                    .padding()
                    .bold()
                    Spacer()
                }
                .navigationTitle("Contact Us")
                .navigationBarItems(trailing: Button("Cancel") {
                    isPresented = false
                })
            }
        }
    }
}

//#Preview {
//    ContactUsView(isPresented: .constant(true))
//}

struct Previews_ContactUsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactUsView(isPresented: .constant(true))
    }
}
