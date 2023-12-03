

import SwiftUI

struct HelpPage: View {
    var body: some View {
        VStack {
            Text("Welcome to the Help Page!")
                .font(.title)
                .padding()

            Text("If you need assistance or want to give us any advices, please send email to us: xxxxxx@gmail.com")
                .multilineTextAlignment(.center)
                .padding()

            // Add more help information here

            .padding()
        }
        .navigationBarTitle("Help")
    }
}


struct Previews_HelpPage_Previews: PreviewProvider {
    static var previews: some View {
        HelpPage()
    }
}
