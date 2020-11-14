//  Created by Tymoteusz Stokarski on 13/11/2020.
//

import Combine

class MaternityLeaveViewModel: ObservableObject {
    
    @Published var query = MaternityLeaveQuery() {
        didSet {
            calculateResult()
        }
    }
    
    @Published var result = MaternityLeaveResult()
    
    private func calculateResult() {
        result.isValid = true
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
    
    private func calculateDate() {
        
    }
    
    
    var info = MaternityLeaveInfo()
    
}
