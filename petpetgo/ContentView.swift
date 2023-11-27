
import SwiftUI


struct ContentView: View {
    
    init() {
        let appear = UINavigationBarAppearance()

        let atters: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "IndieFlower", size: 28)!
        ]
        

        appear.largeTitleTextAttributes = atters
        appear.titleTextAttributes = atters
        UINavigationBar.appearance().standardAppearance = appear
     
        
     }
    //passing the database to another page

    @State
    var animalArray: [Animals] = []
    
    let service = petService()
    
    @State private var selectedTab = 0
    
    var body: some View {
     
        ZStack {
           
                
            NavigationStack {
                
                TabView(selection: $selectedTab){
                    homePage(selectionTap: $selectedTab)
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                        
                    }
                    .tag(0)
                    searchPage(animalArray: $animalArray)
                    .tabItem {
                        Image(systemName:"magnifyingglass")
                        Text("Search")
                    }
                    .tag(1)
                    userPage()
                    .tabItem {
                        Image(systemName:"person")
                        Text("User")
                    }
                    .tag(2)
                    
                }
                .accentColor(.black)
                .navigationBarTitle("petpetgo")
                .navigationBarItems(trailing: Button(action:{ selectedTab = 2 }, label: {
                    Image(systemName: "person.circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40,height:40)
                                    .foregroundColor(.black)
                }))

                .navigationBarTitleDisplayMode(.inline)
                
            }
        }
        .onAppear{
            Task{
                
            do{
                let appear = UINavigationBarAppearance()
                let atters: [NSAttributedString.Key: Any] = [
                    .font: UIFont(name: "IndieFlower", size: 28)!
                ]
                appear.largeTitleTextAttributes = atters
                appear.titleTextAttributes = atters
                UINavigationBar.appearance().standardAppearance = appear
                
               let token = try await service.getAccessToken()
               let accessToken = token.accessToken
                
                try await service.fetchAnimal({
                    (animals: allAnimal) in
                    self.animalArray = animals.animals
                }, withAccessToken: accessToken
                )
                }catch {
                    print("123")
                }
                
            }
            
        }
    }
}

func serviceCall () {
    
}

//#Preview {
//    ContentView()
//}


struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
