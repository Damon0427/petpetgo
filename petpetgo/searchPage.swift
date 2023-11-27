import SwiftUI

struct searchPage: View {
    @State private var searchText = ""
    @Binding var animalArray: [Animals]

    let recommendationTags = ["Cat", "Dog", "Male", "FeMale", "Trained"]

    var body: some View {
        NavigationView {
            VStack {
                Divider()
                    .padding(.vertical, 10)

                HStack {
                    SearchBar(text: $searchText)
                }
                .padding(.horizontal)

                // Recommendation Tags
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(recommendationTags, id: \.self) { tag in
                            RecommendationTagView(tag: tag)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                }

                // Search Results
                List(animalArray.filter { searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText) }) { animal in
                    NavigationLink(destination: AnimalDetailView(animal: animal)) {
                        AnimalRow(animal: animal)
                    }
                }
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea())
            .navigationBarHidden(true) // Hide default navigation bar
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
        Text("Detail page")
        .padding()
    }
}

struct RecommendationTagView: View {
    var tag: String

    var body: some View {
        Text(tag)
            .padding()
            .background(Color.white)
            .foregroundColor(.black)
            .cornerRadius(10)
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
