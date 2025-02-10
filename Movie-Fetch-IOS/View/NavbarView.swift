import SwiftUI

struct NavbarView: View {
    @State var selectedTab: TabIcon = .home
    @State private var Xoffset: CGFloat = 0
    @State var isVisible = true
    @State var Flashing = false
    
    var body: some View {
        VStack{
            ZStack(alignment: .bottom) {
                HStack {
                    ForEach(tabitem) { item in
                        Image(systemName: item.iconname)
                            .font(.title2)
                            .bold()
                            .foregroundStyle(selectedTab == item.tab ? .blue : .gray.opacity(0.4))
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    selectedTab = item.tab
                                    Xoffset = CGFloat(item.index) * 69
                                }
                            }
                            .frame(width: 69, alignment: .center)
                    }
                }
            }
        }
    }
}

#Preview {
    NavbarView()
}
