import SwiftUI

struct LightShape: View {
    var body: some View {
        LineShape()
            .frame(width: 50, height: 150)
            .foregroundStyle(lightGradient)
            .overlay(alignment: .bottom) {
                Rectangle()
                    .frame(width: 50, height: 25)
                    .offset(y: -46)
                    .foregroundStyle(bottomGradient)
                    .blur(radius: 4)
            }
    }
    
    private var lightGradient: LinearGradient {
        LinearGradient(
            stops: [
                .init(color: .light, location: 0.30),
                .init(color: .clear, location: 0.64)
            ],
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    private var bottomGradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [.clear, .bg, .bg]),
            startPoint: .top,
            endPoint: .bottom
        )
    }
}

struct LineShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 12, y: 40))
        path.addLine(to: CGPoint(x: 38, y: 40))
        path.addLine(to: CGPoint(x: 50, y: 100))
        path.addLine(to: CGPoint(x: 0.5, y: 100))
        return path
    }
}

extension Color {
    static let light = Color(red: 1.0, green: 0.9, blue: 0.8)
    static let bg = Color(red: 0.1, green: 0.1, blue: 0.1)
}

#Preview {
    LightShape()
        .preferredColorScheme(.dark)
}


