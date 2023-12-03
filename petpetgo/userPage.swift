

import SwiftUI

struct userPage: View {
    @State private var islogin = false
//    @EnvironmentObject var userViewModel: UserViewModel
    @StateObject var vm = coreDataviewModel()
    
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                if islogin {
                    Image("profile_picture") // change photo here
                    
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(Color.white, lineWidth: 4)
                        )
                        .shadow(radius: 10)
                        .padding()
                    
                    ForEach(vm.saveEntities) {
                        entity in
                        
                        HStack{
                            Text("Hi, ")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.top, 10)
                            
                            
                            Text(" \(entity.firstname ?? "") \(entity.lastname ?? "") ")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.top, 10)
                                .underline()
                        }
                    }
                    Divider()
                        .padding(.vertical, 10)
                    
                    // my info
                    Button(action: {
                        print("Edit inforamtion")
                    }) {
                        Text("Edit My Information")
                            .fontWeight(.bold)
                            .frame(width: 250, height: 20)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                    
                    // my favorite
                    Button(action: {
                        print("Favorite pets")
                    }) {
                        Text("My Favorite")
                            .fontWeight(.bold)
                            .frame(width: 250, height: 20)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                    
                    // help
                    Button(action: {
                        print("help page")
                    }) {
                        Text("Help")
                            .fontWeight(.bold)
                            .frame(width: 250, height: 20)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                    
                    // setting
                    Button(action: {
                        print("Edit setting")
                    }) {
                        Text("Setting")
                            .fontWeight(.bold)
                            .frame(width: 250, height: 20)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                    // log out
                    Button(action: {
                        islogin = false
                    }) {
                        Text("Log out")
                            .fontWeight(.bold)
                            .frame(width: 250, height: 20)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                    
                    Spacer()
                }
                else {
                    loginPage(islogin: $islogin)
                }
            }
        }
        
    }
}

//#Preview {
//    userPage()
//}


struct Previews_userPage_Previews: PreviewProvider {
    static var previews: some View {
        userPage()
    }
}
