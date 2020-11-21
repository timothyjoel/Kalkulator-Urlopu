//  Created by Tymoteusz Stokarski on 21/11/2020.
//

import Foundation

struct SurvivorsPensionQuery {
    var pensionType: SurvivorsPensionInsuranceType = .accident
    var numberOfPeople = 1
    var moneyAmount: Int = 0
}

struct SurvivorsPensionResult {
    var percentage: Float = 0.85
    var calculatedAmount: Float = 0
    var guaranteedAmount: Float = 1320
    var dueAmount: Float = 0
    var dueAmountPerPerson: Float = 0
}
