import SwiftUI

struct NavbarView: View {
    @Binding var selectedTab: TabIcon 
    
    @State var Xoffset: CGFloat = 0
    @State var isVisible = true
    @State var Flashing = false
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                HStack {
                    ForEach(tabitem) { item in
                        Spacer()
                        
                        Image(systemName: item.iconname)
                            .font(.title2)
                            .bold()
                            .foregroundStyle(selectedTab == item.tab ? .yellow : .gray.opacity(0.4))
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    selectedTab = item.tab
                                    Xoffset = CGFloat(item.index) * (UIScreen.main.bounds.width / CGFloat(tabitem.count))
                                }
                            }
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 70)
                .background(Color.bg, in: .rect(cornerRadius: 24))
                .overlay(alignment: .bottomLeading) {
                    VStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.yellow)
                            .frame(width: 50, height: 4)
                        LightShape()
                            .frame(height: 60)
                    }
                    .offset(x: (UIScreen.main.bounds.width / CGFloat(tabitem.count) - 50) / 2, y: 0)
                    .offset(x: Xoffset)
                }
            }
        }
    }
}


#Preview {
    NavbarView(selectedTab: .constant(.home))
        .preferredColorScheme(.dark)
}
