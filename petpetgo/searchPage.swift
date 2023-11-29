import SwiftUI

struct searchPage: View {
    @State private var searchText = ""
    @Binding var animalArray: [Animals]
    @State private var selectedTypeFilter: String = "All"
    @State private var selectedGenderFilter: String = "All"
    
    let recommendationTypeTags = ["All", "Cat", "Dog"]
    let recommendationGenderTags = ["All", "Male", "Female"]
    
    var body: some View {
        NavigationView {
            VStack {
                Divider()
                    .padding(.vertical, 10)
                
                HStack {
                    SearchBar(text: $searchText)
                }
                .padding(.horizontal)
                
                // Animal type and gender filter
                HStack(spacing: 16) {
                    Picker("Type", selection: $selectedTypeFilter) {
                        ForEach(recommendationTypeTags, id: \.self) { tag in
                            Text(tag).tag(tag)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Picker("Gender", selection: $selectedGenderFilter) {
                        ForEach(recommendationGenderTags, id: \.self) { tag in
                            Text(tag).tag(tag)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                .padding()
                
                // Search Results
                List(filteredAnimals) { animal in
                    NavigationLink(destination: AnimalDetailView(animal: animal)) {
                        AnimalRow(animal: animal)
                    }
                }
                .listStyle(PlainListStyle()) // remove default List styling
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea())
            .navigationBarHidden(true) // Hide default navigation bar
        }
    }
    
    // Computed filter animals based on the selection from user
    var filteredAnimals: [Animals] {
        animalArray.filter { animal in
            let typeCondition = selectedTypeFilter == "All" || animal.type == selectedTypeFilter
            let genderCondition = selectedGenderFilter == "All" || animal.gender == selectedGenderFilter
            let searchCondition = searchText.isEmpty || animal.name.localizedCaseInsensitiveContains(searchText)
            return typeCondition && genderCondition && searchCondition
        }
    }
}





struct AnimalRow: View {
    var animal: Animals
    
    var body: some View {
        HStack {
            
            AsyncImage(url: URL(string: animal.photos.first?.small ?? "")) { phase in
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
            
            Text(animal.name)
                .font(.headline)
        }
    }
}


struct AnimalDetailView: View {
    let animal: Animals
    
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                AsyncImage(url: URL(string: animal.photos.first?.full ?? "")) { phase in
                    // Check phase
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 200) // change the height as needed
                    case .empty:
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 200) // change the height as needed
                    case .failure(_):
                        EmptyView()
                    @unknown default:
                        EmptyView()
                    }
                }
                .padding()
                
                
                // Display animal information
                Text("Name: \(animal.name)")
                    .font(.headline)
                Text("Age: \(animal.age)")
                    .font(.headline)
                Text("Type: \(animal.type)")
                    .font(.headline)
                Text("Gender: \(animal.gender)")
                    .font(.headline)
                Text("Size: \(animal.size)")
                    .font(.headline)
                
                
                
                // Display color information
                if let animalColor = animal.colors?.primary {
                    Text("Color: \(animalColor)")
                        .font(.headline)
                    
                    if let secondaryColor = animal.colors?.secondary {
                        Text("Secondary Color: \(secondaryColor)")
                            .font(.headline)
                        
                    }
                    if let tertiaryColor = animal.colors?.tertiary {
                        Text("Tertiary Color: \(tertiaryColor)")
                            .font(.headline)
                        
                    }
                }
                
                // Display breed information
                if let animalBreed = animal.breeds?.primary {
                    Text("Breed: \(animalBreed)")
                        .font(.headline)
                    if let secondaryBreed = animal.breeds?.secondary {
                        Text("Secondary Breed: \(secondaryBreed)")
                            .font(.headline)
                        
                    }
                    
                    if let mix = animal.breeds?.mixed {
                        if mix == true {
                            Text("Breed Mixed")
                                .font(.headline)
                        } else {
                            Text("No Breed Mixed")
                                .font(.headline)
                        }
                    }
                }
                
                
                Text("Description: \(animal.description ?? "")")
                    .padding()
            }
        }
    }
}


struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(8)
                .background(Color(.white))
                .cornerRadius(10)
                .padding(.trailing, 4)
                .padding(.leading, 8)
                .foregroundColor(.primary)
            
            Button(action: {
                // Handle search action
            }) {
                Text("Search")
                    .foregroundColor(.black)
                    .bold()
            }
            .padding(.trailing, 8)
        }
    }
}

struct Previews_searchPage_Previews: PreviewProvider {
    static var previews: some View {
        searchPage(animalArray: .constant([]))
    }
}
