//  Created by Tymoteusz Stokarski on 13/11/2020.
//

import Foundation
import Combine

class MaternityLeaveViewModel: ObservableObject {
    
    init() {
        calculateWeeks()
        calculateDates()
    }
    
    var info = MaternityLeaveInfo()
    @Published var result: MaternityLeaveResult = MaternityLeaveResult(maternityLeave: 0, maternityLeaveStartDate: "", maternityLeaveFinishDate: "", parentalLeave: 0, parentalLeaveStartDate: "", parentalLeaveFinishDate: "", summedLeave: 0)
    
    @Published var query = MaternityLeaveQuery() {
        didSet {
            calculateWeeks()
            calculateDates()
        }
    }
    
    private func calculateWeeks() {
        var maternity: Int = 0
        var parental: Int = 0
        switch query.numberOfKidsBorn {
        case 1: maternity = 20; parental = 32
        case 2: maternity = 31; parental = 34
        case 3: maternity = 33; parental = 34
        case 4: maternity = 35; parental = 34
        case 5: maternity = 37; parental = 34
        default: break
        }
        result.maternityLeave = maternity
        result.parentalLeave = parental
        result.summedLeave = maternity + parental
        
    }
     
    private func calculateDates() {
        result.maternityLeaveStartDate = query.birthDate.stringDate
        
        var maternityLeaveDays = DateComponents()
        maternityLeaveDays.day = (result.maternityLeave * 7) - 1
        let maternityLeaveFinishDate = Calendar.current.date(byAdding: maternityLeaveDays, to: query.birthDate)!
        result.maternityLeaveFinishDate = maternityLeaveFinishDate.stringDate
        
        var parentalLeaveDays = DateComponents()
        parentalLeaveDays.day = (result.parentalLeave * 7) - 1
        let parentalLeaveStartDate = Calendar.current.date(byAdding: oneDay, to: maternityLeaveFinishDate)!
        result.parentalLeaveStartDate = parentalLeaveStartDate.stringDate
        
        let parentalLeaveFinishDate = Calendar.current.date(byAdding: parentalLeaveDays, to: parentalLeaveStartDate)!
        result.parentalLeaveFinishDate = parentalLeaveFinishDate.stringDate
    }
    
    private var oneDay: DateComponents {
        var day = DateComponents()
        day.day = 1
        return day
    }
    
}
