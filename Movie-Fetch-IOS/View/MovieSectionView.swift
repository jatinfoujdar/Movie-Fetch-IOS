import SwiftUI

struct MovieSectionView: View {
    var body: some View {
        ZStack {
            // Background Image (replace with your actual image)
            Image("joker_background") // Replace "joker_background" with your image name
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all) // Optional: If you want the image to fill the entire screen
            
            // Gradient Overlay (Optional: To darken the image a bit)
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.black.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer() // Push content towards the center
                
                // Smaller image thumbnails (replace with your actual images)
                HStack(spacing: 10) {
                    Image("thumbnail1") // Replace with your image name
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 80) // Adjust size as needed
                        .cornerRadius(8)
                    Image("thumbnail2") // Replace with your image name
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 80) // Adjust size as needed
                        .cornerRadius(8)
                    // ... Add more thumbnails as needed
                }
                .padding(.bottom, 20) // Adjust spacing below thumbnails
                
                
                // Main Image (Joker image)
                Image("joker_main") // Replace "joker_main" with your image name
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200) // Adjust width as needed
                    .shadow(radius: 5) // Add a subtle shadow
                
                // Text Content
                VStack(spacing: 5) {
                    Text("DETALL")
                        .font(.headline)
                        .foregroundColor(.white)
                    Text("ITA")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("JOAQUIN PHOENIX")
                        .font(.title2)
                        .foregroundColor(.white)
                    Text("JOKER")
                        .font(.system(size: 40, weight: .bold, design: .default))
                        .foregroundColor(.red)
                    Text("OCTOBER 4")
                        .font(.title3)
                        .foregroundColor(.white)
                }
                .padding(.top, 20) // Adjust spacing above text
                
                Spacer() // Push content towards the center
            }
            
            .padding() // Add padding to the overall VStack
        }
    }
}

#Preview {
    MovieSectionView()
}
