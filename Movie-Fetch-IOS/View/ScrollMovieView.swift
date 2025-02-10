import SwiftUI

struct ScrollMovieView: View {
    private var categories = ["Trending", "New", "Movies", "Serials", "TV Shows", "Cartoon"]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(categories, id: \.self) { category in
                    Text(category)
                        .font(.headline)
                        .foregroundColor(category == "Trending" ? .black : .gray) 
                }
            }
        }
        .padding()
    }
}

#Preview {
    ScrollMovieView()
}
