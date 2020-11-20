//  Created by Tymoteusz Stokarski on 13/11/2020.
//

import Foundation

enum CardImage {
    
    case maternityLeave
    case work1
    case sick
    
    var image: String {
        switch self {
        case .maternityLeave: return "family"
        case .work1: return "work1"
        case .sick: return "sick"
        }
    }
    
}

enum ReusableImages {
    case questionCloud
    
    var image: String {
        switch self {
        case .questionCloud: return "questionCloud"
        }
    }
    
}
