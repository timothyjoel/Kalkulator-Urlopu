//  Created by Tymoteusz Stokarski on 17/11/2020.
//

import Foundation

struct SickLeaveQuery {
    
    var moneyPerMonth: Int
    var daysOnSickLeave: Int
    var percentage: Int
    var sickLeaveReason: SickLeaveReason = .regularSickness
    
}
