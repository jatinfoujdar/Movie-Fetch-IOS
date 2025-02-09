import SwiftUI

struct MovieListView: View {
    @State private var movies: [Movie] = []
    var body: some View {
        VStack{
            List(movies){ movie in
                VStack(alignment: .leading){
                    Text(movie.tittle)
                }
            }
        }
    }
}

#Preview {
    MovieListView()
}
