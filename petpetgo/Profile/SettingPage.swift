
import SwiftUI

struct SettingPage: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack{
                
                Button(action: {
                    print("testing")
                }) {
                    Text("testing")
                        .fontWeight(.bold)
                        .frame(width: 250, height: 20)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    print("testing")
                }) {
                    Text("testing")
                        .fontWeight(.bold)
                        .frame(width: 250, height: 20)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    print("testing")
                }) {
                    Text("testing")
                        .fontWeight(.bold)
                        .frame(width: 250, height: 20)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    print("testing")
                }) {
                    Text("testing")
                        .fontWeight(.bold)
                        .frame(width: 250, height: 20)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
            }
        }
        .navigationBarTitle("Setting")
    }
}


struct Previews_SettingPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingPage()
    }
}
