

import SwiftUI

struct HelpPage: View {
    @State private var showingContactSheet = false
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
            VStack {
                
                Text("Welcome to the Help Page!")
                    .font(.title)
                    .padding()
                
                Text("If you need assistance or want to give us any advices, please send email to us")
                    .multilineTextAlignment(.center)
                    .padding()
                
                Button(action: {
                    showingContactSheet.toggle()
                }
                       , label: {
                    Text("Send!")
                        .font(.title)
                        .frame(width: 120,height: 50)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                })
                .padding()
                .sheet(isPresented: $showingContactSheet) {
                                ContactUsView(isPresented: $showingContactSheet)
                            }
                Spacer()
                
                // Add more help information here if need
                
                    .padding()
            }
            .navigationBarTitle("Help")
        }
    }
}


struct Previews_HelpPage_Previews: PreviewProvider {
    static var previews: some View {
        HelpPage()
    }
}
