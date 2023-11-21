//
//  toolBar.swift
//  petpetgo
//
//  Created by Zicheng Tan on 11/5/23.
//

import SwiftUI

enum icon: String, CaseIterable {
    case house
    case magnifyingglass = "magnifyingglass.circle"
    case person
}

struct toolBar: View {
    
    @Binding var selectedIcon: icon
    
    private var fillImage: String {
        selectedIcon.rawValue + ".fill"
    
    }
    
    let iconName = ["Home","Search","Profile"]
    
    var body: some View {
        VStack{
            HStack{
                ForEach(icon.allCases, id: \.rawValue){ tap in
                    Spacer()

                    VStack {
                        Image(systemName: selectedIcon == tap ? fillImage : tap.rawValue)
                            .scaleEffect(selectedIcon == tap ? 1.2 : 1.0)
                            .foregroundColor(selectedIcon == tap ? .black : .gray)
                            .font(.system(size: 20))
                            .onTapGesture {
                                withAnimation (.easeIn(duration: 0.1)){
                                    selectedIcon = tap
                                }
                            }
                        Text(
                            tap.rawValue == "house" ? "Home" :
                            tap.rawValue == "magnifyingglass.circle" ? "Search":
                            tap.rawValue == "person" ? "Me":
                            tap.rawValue
                        )
                        .foregroundColor(selectedIcon == tap ? .black : .gray)
                    }
                    
                    Spacer()
                    
                }
                
            }
            .frame(width: 400,height: 60)
            .background(.thinMaterial)
            .cornerRadius(20)
            .padding()
        }
        }
    }


//#Preview {
//    //added default value
//    toolBar(selectedIcon: .constant(.house))
//}



struct Previews_toolBar_Previews: PreviewProvider {
    static var previews: some View {
        toolBar(selectedIcon: .constant(.house))
    }
}
