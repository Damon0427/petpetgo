

import SwiftUI

struct userFavoritePage: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
        }
    }
}

struct userFavoritePage_Previews: PreviewProvider {
    static var previews: some View {
        userFavoritePage()
    }
}
