//  Created by Tymoteusz Stokarski on 13/11/2020.
//

import SwiftUI

struct RoundIconView: View {
    
    var icon: Icon
    var size: Image.Scale
    var weight: Font.Weight
    var color: Color
    var background: Color
    
    init(icon: Icon, size: Image.Scale = .medium, weight: Font.Weight = .semibold, background: Color = .customPink, color: Color = .customView) {
        self.icon = icon
        self.size = size
        self.weight = weight
        self.color = color
        self.background = background
    }
    
    var body: some View {
        
        Image(systemName: icon.name)
            .font(.system(size: 20, weight: weight))
            .imageScale(size)
            .frame(width: 32, height: 32)
            .foregroundColor(color)
            .padding(12)
            .background(RoundedCorners(colors: [background], corners: 28))
    }
    
}
