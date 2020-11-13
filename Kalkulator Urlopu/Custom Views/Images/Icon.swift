//  Created by Tymoteusz Stokarski on 04/11/2020.
//

import Foundation

enum Icon {
    
    case questionMark
    case filledInfo
    
    var name: String {
        switch self {
        case .questionMark: return "questionmark"
        case .filledInfo: return "info.circle.fill"
        }
    }
    
}
