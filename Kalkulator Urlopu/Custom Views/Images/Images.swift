//  Created by Tymoteusz Stokarski on 13/11/2020.
//

import Foundation

enum MenuCardImage {
    
    case maternityLeave
    case work1
    
    var image: String {
        switch self {
        case .maternityLeave: return "family"
        case .work1: return "work1"
        }
    }
    
}
