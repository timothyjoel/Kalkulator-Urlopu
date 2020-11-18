//  Created by Tymoteusz Stokarski on 13/11/2020.
//

import Foundation

struct MaternityLeaveQuery {
    var birthDate = Date()
    var numberOfKidsBorn = 1
    var numberOfKidsBornRange = 1...5
}

struct MaternityLeaveResult: Equatable {
    typealias Weeks = Int
    var maternityLeave: Weeks
    var maternityLeaveStartDate: String
    var maternityLeaveFinishDate: String
    var parentalLeave: Weeks
    var parentalLeaveStartDate: String
    var parentalLeaveFinishDate: String
    var summedLeave: Weeks
}
