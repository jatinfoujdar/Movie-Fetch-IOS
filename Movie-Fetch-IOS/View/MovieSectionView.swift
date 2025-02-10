import SwiftUI

struct MovieSectionView: View {
    let images: [(imageName: String, title: String)] = [
        ("1", "Movie 1"),
        ("2", "Movie 2"),
        ("3", "Movie 3"),
        ("5", "Movie 5"),
        ("6", "Movie 6"),
        ("7", "Movie 7"),
        ("8", "Movie 8"),
        ("9", "Movie 9")
    ]

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 10) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(Array(images.enumerated()), id: \.element.imageName) { index, movie in
                            VStack {
                                Image(movie.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200)
                                    .cornerRadius(10)
                                    .scrollTransition(.interactive.animation(.smooth).threshold(.visible(2))) { view, phase in
                                        view
                                            .rotation3DEffect(.degrees(-12), axis: (x: 0, y: 1, z: 0), perspective: 0.8)
                                            .scaleEffect(scale(phase: phase), anchor: .leading)
                                    }
                                
                                Text(movie.title)
                                    .font(.caption)
                                    .lineLimit(1)
                            }
                            .zIndex(-Double(index))
                        }
                    }
                    .padding(.horizontal)
                }
                .scrollClipDisabled()
            }
        }
    }

   
    func scale(phase: ScrollTransitionPhase) -> CGFloat {
        switch phase {
        case .topLeading:
            return 1.1
        case .identity:
            return 1
        case .bottomTrailing:
            return 0.6
        }
    }
}

#Preview {
    MovieSectionView()
        .preferredColorScheme(.dark)
}
