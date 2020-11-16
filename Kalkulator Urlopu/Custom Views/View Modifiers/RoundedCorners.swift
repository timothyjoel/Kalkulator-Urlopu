//  Created by Tymoteusz Stokarski on 03/11/2020.
//

import SwiftUI

struct RoundedCorners: View {
    
    var colors: [Color]
    var startPoint: UnitPoint
    var endPoint: UnitPoint
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0
    
    
    init(colors: [Color] = [.customBackground], startPoint: UnitPoint = .bottom, endPoint: UnitPoint = .top, corners: CGFloat = 10) {
        self.tl = corners
        self.tr = corners
        self.bl =  corners
        self.br =  corners
        self.colors = colors
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
    
    init(colors: [Color] = [.customBackground], startPoint: UnitPoint = .bottom, endPoint: UnitPoint = .top, tl: CGFloat, tr: CGFloat, bl: CGFloat, br: CGFloat) {
        self.tl = tl
        self.tr = tr
        self.bl =  bl
        self.br =  br
        self.colors = colors
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let w = geometry.size.width
                let h = geometry.size.height
                // We make sure the redius does not exceed the bounds dimensions
                let tr = min(min(self.tr, h/2), w/2)
                let tl = min(min(self.tl, h/2), w/2)
                let bl = min(min(self.bl, h/2), w/2)
                let br = min(min(self.br, h/2), w/2)
                
                path.move(to: CGPoint(x: w / 2.0, y: 0))
                path.addLine(to: CGPoint(x: w - tr, y: 0))
                path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
                path.addLine(to: CGPoint(x: w, y: h - br))
                path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
                path.addLine(to: CGPoint(x: bl, y: h))
                path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
                path.addLine(to: CGPoint(x: 0, y: tl))
                path.addArc(center: CGPoint(x: tl, y: tl), radius: tl, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
                }
            .fill(LinearGradient(gradient: Gradient(colors: colors), startPoint: startPoint, endPoint: endPoint))
        }
    }
    
}

struct Layout_Previews: PreviewProvider {
    static var previews: some View {
        RoundedCorners(colors: [.red], corners: 16)
    }
}
