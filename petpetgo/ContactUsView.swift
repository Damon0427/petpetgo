//
//  ContactUsView.swift
//  petpetgo
//
//  Created by Zicheng Tan on 12/2/23.
//

import SwiftUI

struct ContactUsView: View {
    @Binding var isPresented: Bool
    @State private var userMessage = ""
    @State private var userEmail = ""

    var body: some View {
        NavigationView {
            VStack (alignment:.leading){
                Divider()
                Text("Please enter your email:")
                    .padding()
            TextField("Enter your email", text: $userEmail)
                    .padding()
                Text("Please enter your message:")
                    .padding()

                TextEditor(text: $userMessage)
                    .frame(height: 100)
                    .padding()

                Button("Send") {
                    print("User message: \(userMessage)")
                    isPresented = false
                        
                }
                .frame(width: 50,height: 20)
                .background(Color.white)
                .foregroundStyle(Color.mint)
                .cornerRadius(6)
                .padding()
                Spacer()
            }
            .navigationTitle("Contact Us")
            .navigationBarItems(trailing: Button("Cancel") {
                isPresented = false
            })
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
