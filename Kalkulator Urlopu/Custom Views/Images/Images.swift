//  Created by Tymoteusz Stokarski on 13/11/2020.
//

import Foundation

enum ImageAsset {
    
    case family
    case work1
    case sick
    case questionCloud
    case moneyFromBox
    case girl
    
    var image: String {
        switch self {
        case .family: return "family"
        case .work1: return "work1"
        case .sick: return "sick"
        case .questionCloud: return "questionCloud"
        case .moneyFromBox: return "moneyFromBox"
        case .girl: return "girl"
        }
    }
    
}
