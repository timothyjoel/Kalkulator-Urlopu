//  Created by Tymoteusz Stokarski on 12/11/2020.
//

import Foundation

extension Double {
    
    /// Rounds double to upper Intiger value
    var roundedUp: Int {
        var rounded = self - self.truncatingRemainder(dividingBy: 1)
        if self.truncatingRemainder(dividingBy: 1) > 0 { rounded += 1 }
        return Int(rounded)
    }
    
}
