//  Created by Tymoteusz Stokarski on 04/11/2020.
//

import SwiftUI

struct Icon: View {
    
    var icon: IconImage
    var color: Color?
    var side: CGFloat
    
    init(icon: IconImage, color: Color? = .customLabel, side: CGFloat = 32) {
        self.icon = icon
        self.color = color
        self.side = side
    }
    
    var body: some View {
        
        Image(systemName: icon.name)
        //    .resizable()
        //    .frame(width: 16, height: 16)
       //     .scaledToFit()
            .scaleEffect(1.1)
            .foregroundColor(color)
        
    }
    
    enum IconImage {
        
        case info
        
        var name: String {
            switch self {
            case .info: return "info.circle.fill"
            }
        }
        
    }
    
}
