//  Created by Tymoteusz Stokarski on 03/11/2020.
//

import Combine
import SwiftUI

class DaysOffViewModel: ObservableObject  {

    @Published var query = DaysOffQuery() {
        didSet {
            calculateResult()
        }
    }
    @Published var result = DaysOffResult()
    
    private func validateQuery() {
        let time = query.endDate.timeIntervalSince1970 - query.beginDate.timeIntervalSince1970
        switch time {
        case ...5000: result.isValid = false
        case 5000...: result.isValid = true
        default: break
        }
    }
    
    private func calculateResult() {
        setWorkingTime()
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
    
    private func setWorkingTime() {
        switch query.workingTime {
        case 5...: query.workingTime = 4
        case ...0: query.workingTime = 1
        default: break
        }
    }
    
}
