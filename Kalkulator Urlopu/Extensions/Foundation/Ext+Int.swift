//  Created by Tymoteusz Stokarski on 19/11/2020.
//

import Foundation

extension Int {
    
    func asString() -> String {
        return String(self)
    }
    
    func trimTo(_ max: Int) -> Int {
        self > max ? max : self
    }
    
}
