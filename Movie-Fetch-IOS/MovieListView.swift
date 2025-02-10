import SwiftUI

struct MovieListView: View {
    @State private var movies: [Movie] = []
    @State private var searchQuery: String = ""
    @State private var isSearching: Bool = false
    
    var body: some View {
        VStack {
            if movies.isEmpty {
                Text("No movies available")
                    .padding()
            } else {
                List(movies) { movie in
                    VStack(alignment: .leading) {
                       
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
}

#Preview {
    MovieListView()
}
