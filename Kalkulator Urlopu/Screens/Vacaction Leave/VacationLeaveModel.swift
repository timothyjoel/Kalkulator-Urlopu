//  Created by Tymoteusz Stokarski on 11/11/2020.
//

import Foundation

struct VacationLeaveQuery {
    typealias QuartersNumber = Int
    var beginDate = Date()
    var endDate = Date()
    var workingTime: QuartersNumber = 4
    var workingTimeRange = 1...4
    var workedLessThanTenYears = true
}

struct VacationLeaveResult: Equatable {
    var daysOff: Int?
    var hoursOff: Int?
    var workedMonths: Int?
    var daysOffInYear: Int?
    var workHoursPerWeek: Int?
}
