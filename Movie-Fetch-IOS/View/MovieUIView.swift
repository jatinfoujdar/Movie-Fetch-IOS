import SwiftUI

struct MovieUIView: View {
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    
                    HStack{
                        Text("iNox")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                        Image("1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.red, lineWidth: 2))
                    }
                    .foregroundStyle(.white)
                    .padding(.horizontal)
                    
                    ScrollMovieView()
                        .foregroundStyle(.white)
                     
                    
                    MovieSectionView()
                    
                    Spacer()
                    
                    MovieCardView()
                        .foregroundStyle(.white)
                    
                    Spacer()
                    MovieDisplayView()
                        .preferredColorScheme(.dark)
                    
                }
                
            }
        }
    }
}

#Preview {
    MovieUIView()
}
