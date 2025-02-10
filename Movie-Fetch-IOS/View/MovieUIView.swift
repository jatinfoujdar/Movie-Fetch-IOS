import SwiftUI

struct MovieUIView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.green.opacity(0.9)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack{
                ScrollMovieView()
                    .foregroundStyle(.white)
                    .padding()
                Spacer()
                
                NavbarView()
                    
            }
            
        }
    }
}

#Preview {
    MovieUIView()
}
