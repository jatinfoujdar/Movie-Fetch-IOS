import SwiftUI

struct MovieDisplayView: View {
    let movies: [Card] = [
        Card(imageName: "7", title: "Moana 2", genre: "Animation, Adventure"),
        Card(imageName: "8", title: "Wolf Man", genre: "Horror, Thriller"),
        Card(imageName: "9", title: "The Other", genre: "Mystery, Drama"),
        Card(imageName: "1", title: "Solo Leveling", genre: "Action, Fantasy"),
        Card(imageName: "2", title: "Better Man", genre: "Drama, Romance"),
        Card(imageName: "3", title: "Ne Zha 2", genre: "Animation, Adventure"),
        Card(imageName: "5", title: "Newtopia", genre: "Sci-Fi, Thriller"),
        Card(imageName: "6", title: "Thunderbolts", genre: "Action, Superhero")
    ]
    
    @State private var animateHeader = false

    var body: some View {
        VStack(spacing: 20) {
            ScrollView{
                VStack {
                    Text("Christmas Mix!")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.red)
                        .shadow(color: .green, radius: animateHeader ? 10 : 5)
                        .scaleEffect(animateHeader ? 1.1 : 1.0)
                        .animation(.easeInOut(duration: 1.5).repeatForever(), value: animateHeader)
                        .onAppear { animateHeader = true }
                    
                    Text("Holiday Special Collection")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                }
                .padding(.vertical, 30)
                .frame(maxWidth: .infinity)
                .background(
                    Image("christmas-header")
                        .resizable()
                        .scaledToFill()
                        .overlay(Color.black.opacity(0.4))
                )
                .cornerRadius(15)
                .padding(.horizontal)
                
                // Movie Grid
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 20) {
                    ForEach(movies) { movie in
                        NavigationLink {
                            // Detail View would go here
                        } label: {
                            MovieCard(movie: movie)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
            .background(
                LinearGradient(
                    colors: [Color(.systemBackground), Color.red.opacity(0.1)],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
            )
        }
    }
}

struct MovieCard: View {
    let movie: Card
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(movie.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 220)
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.red, lineWidth: 2)
                )
                .shadow(color: .green.opacity(0.3), radius: 10, x: 0, y: 5)
            
            Text(movie.title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.top, 8)
            
            Text(movie.genre)
                .font(.caption)
                .foregroundColor(.gray)
        }
  
    }
}



#Preview {
    MovieDisplayView()
        .preferredColorScheme(.dark)
}
