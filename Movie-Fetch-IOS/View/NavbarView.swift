import SwiftUI

struct NavbarView: View {
    @State var selectedTab: TabIcon = .home
    @State var Xoffset: CGFloat = 0
    @State var isVisible = true
    @State var Flashing = false
    
    var body: some View {
        VStack{
            ZStack(alignment: .bottom) {
                HStack {
                    ForEach(tabitem) { item in
                        Spacer()
                        
                        Image(systemName: item.iconname)
                            .font(.title2)
                            .bold()
                            .foregroundStyle(.gray.opacity(0.4))
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    selectedTab = item.tab
                                    Xoffset = CGFloat(item.index) * 69
                                }
                            }
                        Spacer()
                    }
                    .frame(width: 23)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 70)
                .background(Color.bg, in: .rect(cornerRadius: 24))
                .overlay(alignment: .topLeading) {
                    VStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 50, height: 4)
                        LightShape()
                            .frame(height: 70)
                    }
                    .offset(x: 35, y: 0)
                    .offset(x: Xoffset)
                }
            }
        }
    }
}

#Preview {
    NavbarView()
        .preferredColorScheme(.dark)
}
