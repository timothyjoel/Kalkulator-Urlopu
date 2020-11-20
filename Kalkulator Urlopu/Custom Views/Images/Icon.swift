//  Created by Tymoteusz Stokarski on 04/11/2020.
//

import Foundation

enum Icon {
    
    case questionMark
    case filledInfo
    case circleFilled
    case circleEmpty
    case list
    case grid
    
    
    var name: String {
        switch self {
        case .questionMark: return "questionmark"
        case .filledInfo: return "info.circle.fill"
        case .circleEmpty: return "circle"
        case .circleFilled: return "largecircle.fill.circle"
        case .list: return "list.dash"
        case .grid: return "rectangle.grid.1x2"
        }
    }
    
}
