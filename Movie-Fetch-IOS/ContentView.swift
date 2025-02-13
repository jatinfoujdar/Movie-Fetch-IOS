import SwiftUI


struct ContentView: View {
    @State private var selectedTab: TabIcon = .home
    
    var body: some View {
        RivePullToRefreshView() {
            VStack {
                switch selectedTab {
                case .home:
                    MovieUIView()
                case .card:
                    MovieListView()
                case .favorite:
                    Text("Favorite View")
                case .purchase:
                    Text("Purchase View")
                case .notification:
                    Text("Notification View")
                }
            }
        } onRefresh: {
            try? await Task.sleep(nanoseconds: 3_000_000_000)
        }
        NavbarView(selectedTab: $selectedTab)
    }
}


#Preview {
    ContentView()
}
