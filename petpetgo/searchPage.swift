
import SwiftUI

struct searchPage: View {
    @State private var searchText = ""
    
    let recommendationTags = ["Cat", "Dog", "Male", "FeMale", "Rabbit", "Trained"]

    let photos: [Photo] = [
        Photo(name: "result 1", imageName: "result1"),
        Photo(name: "result 2", imageName: "result2"),
        Photo(name: "result 3", imageName: "result3"),
        Photo(name: "result 4", imageName: "result4"),
        Photo(name: "result 5", imageName: "result5"),
        Photo(name: "result 6", imageName: "result6"),
        // Add more photos as needed
    ]
    
    var body: some View {
            
            NavigationView {
                
                VStack {
                    
                    Divider()
                        .padding(.vertical, 10)
                    
                    HStack {
//                        Button(action: {
//                            // Handle back button action
//                        }) {
//                            Image(systemName: "chevron.left")
//                                .imageScale(.large)
//                                .padding(.leading, 8)
//                        }

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
                    List(photos.filter { searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText) }) { photo in
                        NavigationLink(destination: PhotoDetail(photo: photo)) {
                            PhotoRow(photo: photo)
                            
                        }
                    }
                }
                
                .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea())
                .navigationBarHidden(true) // Hide default navigation bar
                
            }
        
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


struct Photo: Identifiable {
    var id = UUID()
    var name: String
    var imageName: String
}

struct PhotoRow: View {
    var photo: Photo

    var body: some View {
        
        HStack {
            
            Image(photo.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(Circle())

            Text(photo.name)
                .padding(.leading, 10)
        }
    }
}

struct PhotoDetail: View {
    var photo: Photo
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                Image(photo.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Text(photo.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                // Add more details or actions as needed
            }
            .navigationBarTitle(photo.name, displayMode: .inline)
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

//#Preview {
//    searchPage()
//}

struct Previews_searchPage_Previews: PreviewProvider {
    static var previews: some View {
        searchPage()
    }
}
