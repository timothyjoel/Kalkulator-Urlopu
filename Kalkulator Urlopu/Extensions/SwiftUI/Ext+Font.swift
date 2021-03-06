//  Created by Tymoteusz Stokarski on 12/11/2020.
//

import SwiftUI

extension Font {
    
    static var smallText: Font {
        .system(size: 12, weight: .medium, design: .rounded)
    }
    
    static var text: Font {
        .system(size: 15, weight: .medium, design: .rounded)
    }
    
    static var boldedText: Font {
        .system(size: 15, weight: .semibold, design: .rounded)
    }
    
    static var header: Font {
        .system(size: 15, weight: .semibold, design: .rounded)
    }
    
    static var navigation: Font {
        .system(size: 30, weight: .bold, design: .default)
    }
    
}
