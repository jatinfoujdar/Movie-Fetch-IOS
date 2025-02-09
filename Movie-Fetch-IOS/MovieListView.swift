import SwiftUI

struct MovieListView: View {
    @State private var movies: [Movie] = []
    
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
