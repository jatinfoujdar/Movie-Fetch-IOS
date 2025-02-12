import SwiftUI

struct ScrollMovieView: View {
    
    private var categories = ["Trending", "New", "Movies", "Serials", "TV Shows", "Cartoon"]
    @State private var selectedCategory: String = "Trending"
    
    var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(categories, id: \.self) { category in
                        Text(category)
                            .font(.headline)
                            .foregroundColor(category == selectedCategory ? .white : .gray)
                            .onTapGesture {
                                selectedCategory = category
                            }
                    }
                }
            }
            .padding()
    }
}

#Preview {
    ScrollMovieView()
}
