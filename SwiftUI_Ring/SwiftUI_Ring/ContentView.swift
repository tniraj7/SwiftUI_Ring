import SwiftUI

struct ContentView: View {
    
    var color1 = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
    var color2 = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
    var color3 = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
    var color4 = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    var width: CGFloat = 200
    var height: CGFloat = 200
    var percent: CGFloat = 60
    
    var body: some View {
        let multiplier = width / 44
        let progress = 1 - (percent / 100)
        
        return ZStack {
            Circle()
                .stroke(
                    Color.black.opacity(0.1),
                    style: StrokeStyle(lineWidth: 5 * multiplier)
                )
                .frame(width: width, height: height)
            
            Circle()
                .trim(from: progress, to: 1)
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: [Color(color1), Color(color2), Color(color3), Color(color4)]),
                        startPoint: .topTrailing,
                        endPoint: .bottomLeading),
                    style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20,0], dashPhase: 0))
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                .frame(width: width, height: height)
                .shadow(color: Color(color2).opacity(0.3), radius: 3 * multiplier, x: 0, y: 3 * multiplier)
            
            Text("82%")
                .font(.subheadline)
                .fontWeight(.bold)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
