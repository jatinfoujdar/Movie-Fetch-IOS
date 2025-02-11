import SwiftUI

struct ContentView: View {
    @State private var selectedTab: TabIcon = .home
    var body: some View {
        VStack {
           
            switch selectedTab {
            case .home:
                MovieUIView()
            case .card:
                Text("Card View")
            case .favorite:
                Text("Favorite View")
            case .purchase:
                Text("Purchase View")
            case .notification:
                Text("Notification View")
            }
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
