//  Created by Tymoteusz Stokarski on 04/11/2020.
//

import Foundation

enum Icon {
    
    case questionMark
    
    var name: String {
        switch self {
        case .questionMark: return "questionmark"
        }
    }
    
}
