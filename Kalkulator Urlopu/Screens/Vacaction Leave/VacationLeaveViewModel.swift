//  Created by Tymoteusz Stokarski on 03/11/2020.
//

import Combine
import SwiftUI

class VacationLeaveViewModel: ObservableObject  {
    
    init() {
        calculate { [weak self] in self?.result = $0 }
    }
    
    var webLinks: [WebLink] = [WebLink(title: "Kodeks pracy, Art. 152-175", url: .kokdeksPracy)]
    
    @Published var query = VacationLeaveQuery() {
        didSet {
            calculate { result = $0 }
        }
    }
    @Published var result = VacationLeaveResult()
    
    private var isValidQuery: Bool {
        query.endDate.timeIntervalSince1970 - query.beginDate.timeIntervalSince1970 > 5000 ? true : false
    }
    
    private func calculate(completion: (VacationLeaveResult) -> Void)  {
        guard isValidQuery else { completion(VacationLeaveResult()); return }
        
        let components = Calendar.current.dateComponents([.day, .hour], from: query.beginDate, to: query.endDate)
        var days = components.day!
        if components.hour! > 0 && components.day! >= 0 { days += 1 }
        
        let workHoursPerWeek = query.workingTime * 10
        let daysOffInYear = query.workedLessThanTenYears ? 20 : 26
        let workedMonths = ((Double(days)/365) * 12).roundedUp
        let daysOff = (Double(workedMonths)/12 * Double(daysOffInYear) * (Double(query.workingTime)/4)).roundedUp
        let hoursOff = daysOff*24
        
        completion(VacationLeaveResult(daysOff: daysOff, hoursOff: hoursOff, workedMonths: workedMonths, daysOffInYear: daysOffInYear, workHoursPerWeek: workHoursPerWeek))
    }
    
}
