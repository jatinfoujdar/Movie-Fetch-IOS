import SwiftUI

struct MovieListView: View {
    
    @State private var movies: [Movie] = []
    @State private var searchQuery: String = ""
    @State private var isSearching: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search Movies", text: $searchQuery)
                    .padding(.leading, 24)
                    .padding(.vertical, 8)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding()
                
                if isSearching {
                    Button("Cancel") {
                        searchQuery = ""
                        isSearching = false
                    }
                    .padding()
                }
            }
            
            if movies.isEmpty {
                Text("No movies available")
                    .padding()
            } else {
                List(filteredMovies) { movie in
                    VStack(alignment: .leading) {
                        AsyncImage(url: movie.posterUrl) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 180)
                        } placeholder: {
                            Image(systemName: "film")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 180)
                                .foregroundColor(.gray)
                        }
                                           .padding(.top, 5)
                        
                        Text(movie.title)
                            .font(.headline)
                            .padding(.top, 5)
                        
                        Text(movie.overview)
                            .font(.subheadline)
                            .lineLimit(3)
                            .padding(.top, 5)
                        
                        Text("Release Date: \(movie.releaseDate ?? "Unknown")")
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .padding(.top, 5)
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            Task {
                do {
                    let fetchedMovies = try await NetworkManager.shared.fetchMovies()
                    movies = fetchedMovies
                } catch {
                    print("Error in fetching movies: \(error)")
                }
            }
        }
    }

    var filteredMovies: [Movie] {
        if searchQuery.isEmpty {
            return movies
        } else {
            return movies.filter { movie in
                movie.title.lowercased().contains(searchQuery.lowercased())
            }
        }
    }
    
}

#Preview {
    MovieListView()
        .preferredColorScheme(.dark)
}
