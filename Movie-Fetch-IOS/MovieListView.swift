import SwiftUI

struct MovieListView: View {
    @State private var movies: [Movie] = []
    var body: some View {
        VStack{
            List(movies){ movie in
                VStack(alignment: .leading){
                    Text(movie.title)
                }
            }
        }
        .onAppear{
            Task{
                do{
                    let fetchMovies = try await NetworkManager.shared.fetchMovies()
                    movies = fetchMovies
                }catch{
                    print("error in fetch")
                }
            }
        }
    }
}

#Preview {
    MovieListView()
}
