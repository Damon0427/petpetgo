import SwiftUI

struct userFavoritePage: View {
    @StateObject var vm = coreDataviewModel()
    @State private var showSheetPresented = false

    var body: some View {
            
            NavigationStack{
                VStack{
                    
                    if let userAnimals = vm.fetchLoggedInUserAnimals() {
                        
                        
                        List(userAnimals) {
                            animal in
                            
                            Button(action: {
                                
                                showSheetPresented.toggle()
                                
                            }) {
                                HStack {
                                    Image(systemName: "star.fill")
                                        .frame(width: 40, height: 40)
                                    
                                        .foregroundColor(.yellow)
                                        .padding(.trailing, 5)
                                    
                                    AsyncImage(url: URL(string: animal.photo ?? "")) { phase in
                                        //check phase
                                        switch phase {
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 80, height: 80)
                                                .clipShape(Circle())
                                        case .empty:
                                            Image(systemName: "photo")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 80, height: 80)
                                                .clipShape(Circle())
                                        case .failure(_):
                                            EmptyView()
                                        @unknown default:
                                            EmptyView()
                                        }
                                        
                                    }
                                    Text(animal.name ?? "No name yet")
                                        .foregroundColor(.primary)
                                    Spacer()
                                    
                                }
                            }
                            
                            
                            .frame(width: 300, height: 120)
                            .padding(10)
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(radius: 4)
                        }
                    }
                    }
                
                        .sheet(isPresented: $showSheetPresented) {
        
                            ContactUsView(isPresented: $showSheetPresented)
                    
                    }
                        
                        
                            .navigationBarTitle("Favorites", displayMode: .automatic)
                            .navigationBarItems(trailing: EditButton())
                            .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                .ignoresSafeArea())
                            .padding(.horizontal, 10)
                        
            }
            .onAppear{
                DispatchQueue.main.async {
                    vm.fetchUser()
                    vm.fetchAnimal()
                    
                }
            }
        }
        
    
    }
