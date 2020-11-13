//  Created by Tymoteusz Stokarski on 03/11/2020.
//

import Combine
import SwiftUI

class VacationLeaveViewModel: ObservableObject  {
    
    @Published var query = VacationLeaveQuery() {
        didSet {
            calculateResult()
        }
    }
    @Published var result = VacationLeaveResult()
    var info = VacationLeaveInfo()
    
    private func validateQuery() {
        let time = query.endDate.timeIntervalSince1970 - query.beginDate.timeIntervalSince1970
        result.isValid = time > 5000 ? true : false
    }
    
    private func calculateResult() {
        validateQuery()
        guard result.isValid else { return }
    
        result.workHoursPerWeek = query.workingTime * 10
        result.daysOffInYear = query.workedLessThanTenYears ? 20 : 26
        let components = Calendar.current.dateComponents([.day, .hour], from: query.beginDate, to: query.endDate)
        var days = components.day!
        if components.hour! > 0 && components.day! >= 0 { days += 1 }

        let monthsWorked = ((Double(days)/365) * 12).roundedUp
        result.workedMonths = monthsWorked
        
        let daysOff = (Double(monthsWorked)/12 * Double(result.daysOffInYear) * (Double(query.workingTime)/4)).roundedUp
        result.daysOff = daysOff
        
        let hoursOff = daysOff*24
        result.hoursOff = hoursOff
    }
    
}
