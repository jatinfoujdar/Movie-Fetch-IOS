import SwiftUI

struct MovieUIView: View {
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.black.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
        
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ScrollMovieView()
                        .foregroundStyle(.white)
                        .padding()
                    
                    MovieSectionView()
                    
                    Spacer()
                    
                    MovieCardView()
                        .foregroundStyle(.white)
                    
                    Spacer()
                    MovieDisplayView()
                        .preferredColorScheme(.dark)
                }
            }
            
            
            VStack {
                Spacer()
                NavbarView()
            }
        }
    }
}

#Preview {
    MovieUIView()
}
