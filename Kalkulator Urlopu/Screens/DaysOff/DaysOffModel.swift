//  Created by Tymoteusz Stokarski on 11/11/2020.
//

import Foundation

struct DaysOffQuery {
    var beginDate = Date()
    var endDate = Date()
    /// Working time as number of quarters
    var workingTime = 4
    var workedLessThanTenYears = true
}

struct DaysOffResult {
    var isValid: Bool = false
    var message: String = "Wypełnij powyższe dane"
    var daysOff: Int = 0
    var hoursOff: Int = 0
    var workedMonths: Int = 0
    var daysOffInYear: Int = 0
    var workHoursPerWeek: Int = 0
}

