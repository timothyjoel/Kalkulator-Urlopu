//  Created by Tymoteusz Stokarski on 13/11/2020.
//

import Foundation

enum ImageAsset {
    
    case maternityLeave
    case work1
    case sick
    case questionCloud
    case moneyFromBox
    
    var image: String {
        switch self {
        case .maternityLeave: return "family"
        case .work1: return "work1"
        case .sick: return "sick"
        case .questionCloud: return "questionCloud"
        case .moneyFromBox: return "moneyFromBox"
        }
    }
    
}
