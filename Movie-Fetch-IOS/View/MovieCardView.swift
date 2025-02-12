import SwiftUI

struct MovieCardView: View {
    let movies: [Card] = [
        Card(imageName: "7", title: "Moana 2", genre: "Animation, Adventure"),
        Card(imageName: "8", title: "Wolf Man", genre: "Horror, Thriller"),
        Card(imageName: "9", title: "The Other", genre: "Mystery, Drama"),
        Card(imageName: "1", title: "Solo Leveling", genre: "Action, Fantasy"),
        Card(imageName: "2", title: "Better Man", genre: "Drama, Romance"),
        Card(imageName: "3", title: "Ne Zha 2", genre: "Animation, Adventure"),
        Card(imageName: "5", title: "Newtopia", genre: "Sci-Fi, Thriller"),
        Card(imageName: "6", title: "Thunderbolts", genre: "Action, Superhero"),
       
    ]
    
    var body: some View {
        VStack{
            HStack{
                Text("For You")
                    .fontWeight(.bold)
                Spacer()
                
                Text("See All")
                    .foregroundStyle(.gray)
                    .fontWeight(.bold)
            }
            Divider()
        }
        .padding()
            ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(movies) { movie in
                    Image(movie.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 150)
                        .cornerRadius(10)
                        .clipped()
                }
            }
            .padding()
        }
    }
}

#Preview {
    MovieCardView()
        .preferredColorScheme(.dark)
}


