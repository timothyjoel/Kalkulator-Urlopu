//  Created by Tymoteusz Stokarski on 21/11/2020.
//

import Foundation
import Combine

class SurvivorsPensionViewModel: ObservableObject {
    
    // MARK: Properties
    var webLinks: [WebLink] = [WebLink(title: "Ustawa o emeryturach i rentach z Funduszu Ubezpieczeń Społecznych, Art. 73, 74, 85", url: .emeryturyRenty)]
    var survivorsPensionInsuranceTypes = SurvivorsPensionInsuranceType.allCases
    
    @Published var query = SurvivorsPensionQuery() {
        didSet  {
            calculateResults()
        }
    }
    @Published var result = SurvivorsPensionResult()
    
    // MARK: - Methods
    private func calculateResults() {
        result.percentage = percentage
        result.calculatedAmount = Float(query.moneyAmount) * percentage
        result.guaranteedAmount = query.pensionType == .accident ? 1320 : 1100
        let amount = result.calculatedAmount > result.guaranteedAmount ? result.calculatedAmount : result.guaranteedAmount
        result.dueAmount = amount
        result.dueAmountPerPerson = amount / Float(query.numberOfPeople)
    }
    
    private var percentage: Float {
        switch query.numberOfPeople {
        case 1: return 0.85
        case 2: return 0.90
        default: return 0.95
        }
    }
    
}

enum SurvivorsPensionInsuranceType: StringDescriptiveItem {
    
    case accident
    case pension
    
    var description: String {
        switch self {
        case .accident: return "wypadkowego"
        case .pension: return "rentowego"
        }
    }
    
}
