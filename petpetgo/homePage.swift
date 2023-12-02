//
//  homePage.swift
//  petpetgo
//
//  Created by Zicheng Tan on 11/9/23.
//

import SwiftUI

struct homePage: View {
    @State private var showingContactSheet = false
    @State private var userMessage = ""
    @Binding var selectedTap: Int
    let gallery: [String] = ["animal2","animal1","cat1"]
    let width = UIScreen.main.bounds.width
    @State private var currentIndex = 0
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
                
            VStack{
                Divider()
                TabView(selection: $currentIndex) {
                    
                    ForEach(gallery, id: \.self) { picture in
                        
                        Image(picture)
                            .resizable()
                    }
                }
                
                .tabViewStyle(PageTabViewStyle())
                .frame(width: width - 80, height: 200)
                Divider()
                    .opacity(2)
                    .padding()
                Text("Meet your Animal:")
                    .foregroundStyle(Color.purple)
                    .font(.title)
                HStack(){
                    
                    Button(action: {
                        selectedTap = 1;
                        
                    }, label: {
                        Image("dogIcon")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.yellow, lineWidth: 2))
                            .padding()
                    })
                
                
                
                Button(action: {
                    selectedTap = 1;
                    
                }, label: {
                    Image("catIcon")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.yellow, lineWidth: 2))
                        .padding()
                })
                
                
            }
                Text("We are hiring volunteers")
                    .foregroundStyle(Color.purple)
                    .font(.title)
                Button(action: {
                    showingContactSheet.toggle()
                }
                       , label: {
                    Text("Contact us!")
                        .font(.title2)
                        .frame(width: 240,height: 50)
                        .background(Color.yellow1)
                        .foregroundStyle(Color.black)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                })
                .padding()
                .sheet(isPresented: $showingContactSheet) {
                                ContactUsView(isPresented: $showingContactSheet)
                            }
                Spacer()
            }
            
            
            
        }
    }
}

//#Preview {
//    homePage(selectionTap: .constant(1))
//}


struct Previews_homePage_Previews: PreviewProvider {
    static var previews: some View {
        homePage(selectedTap: .constant(1))
    }
}
