import SwiftUI

struct MovieSectionView: View {
    let images: [(imageName: String, title: String, genre: String)] = [
        ("1", "Solo Leveling", "Action, Fantasy"),
        ("2", "Better Man", "Drama, Romance"),
        ("3", "Ne Zha 2", "Animation, Adventure"),
        ("5", "Newtopia", "Sci-Fi, Thriller"),
        ("6", "Thunderbolts", "Action, Superhero"),
        ("7", "Moana 2", "Animation, Adventure"),
        ("8", "Wolf Man", "Horror, Thriller"),
        ("9", "The Other", "Mystery, Drama")
    ]

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
                .blur(radius: 20)

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
                                    .shadow(color: Color.green.opacity(0.8), radius: 10, x: 0, y: 0)
                                
                                
                                Text(movie.title)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                    .lineLimit(1)

                                Text(movie.genre)
                                    .font(.caption)
                                    .foregroundStyle(.white)
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
