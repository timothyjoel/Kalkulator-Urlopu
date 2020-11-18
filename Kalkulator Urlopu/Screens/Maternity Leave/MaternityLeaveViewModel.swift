//  Created by Tymoteusz Stokarski on 13/11/2020.
//

import Foundation
import Combine

class MaternityLeaveViewModel: ObservableObject {
    
    var webLinks: [WebLink] = [WebLink(title: "Kodeks pracy, Art. 180", url: .labourLaw)]
    @Published var result: MaternityLeaveResult!
    @Published var query = MaternityLeaveQuery() { didSet { calculate { [weak self] in self?.result = $0 } } }
    
    
    init() {
        calculate { [weak self] in self?.result = $0 }
    }
    

    
    private func calculate(completion: (MaternityLeaveResult) -> Void) {
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
        
        let maternityLeaveStartDate = query.birthDate.stringDate
        
        var maternityLeaveDays = DateComponents()
        maternityLeaveDays.day = (maternity * 7) - 1
        let maternityLeaveFinishDate = Calendar.current.date(byAdding: maternityLeaveDays, to: query.birthDate)!
        
        var parentalLeaveDays = DateComponents()
        parentalLeaveDays.day = (parental * 7) - 1
        let parentalLeaveStartDate = Calendar.current.date(byAdding: oneDay, to: maternityLeaveFinishDate)!
        let parentalLeaveFinishDate = Calendar.current.date(byAdding: parentalLeaveDays, to: parentalLeaveStartDate)!
        
        completion(MaternityLeaveResult(
                    maternityLeave: maternity,
                    maternityLeaveStartDate: maternityLeaveStartDate,
                    maternityLeaveFinishDate: maternityLeaveFinishDate.stringDate,
                    parentalLeave: parental,
                    parentalLeaveStartDate: parentalLeaveStartDate.stringDate,
                    parentalLeaveFinishDate: parentalLeaveFinishDate.stringDate,
                    summedLeave: maternity + parental))
    }
    
    private var oneDay: DateComponents {
        var day = DateComponents()
        day.day = 1
        return day
    }
    
}
