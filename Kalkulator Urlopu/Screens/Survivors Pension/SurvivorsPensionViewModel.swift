//  Created by Tymoteusz Stokarski on 21/11/2020.
//

import Foundation
import Combine

class SurvivorsPensionViewModel: ObservableObject {
    
    var webLinks: [WebLink] = [WebLink(title: "Nowa preferencja w podatku dochodowym od osób fizycznych dla młodych osób", url: .ulgaPodatkowaDlaMlodych)]
    var survivorsPensionInsuranceTypes = SurvivorsPensionInsuranceType.allCases
    @Published var pensionType: SurvivorsPensionInsuranceType = .accident
    @Published var numberOfPeople = 1
    
    var pensionContribution1 = 9.76
    var pensionContribution2 = 1.5
    var sicknessContribution = 2.45
    var healhtInsuranceContribution = 9
    
    @Published var acquireDate = Date()
    
    @Published var grossSalary: Int = 0 {
        didSet  {
            calculateResults()
        }
    }
    
    @Published var netSalary: Float = 0
    
    func calculateResults() {
        let pension1 = Double(grossSalary) * pensionContribution1 / 100
        let pension2 = Double(grossSalary) * pensionContribution2 / 100
        let sickness = Double(grossSalary) * sicknessContribution / 100
        let basisForHealthInsurance = Double(grossSalary) -  Double(pension1) - Double(pension2) - Double(sickness)
        let healthInsurance = Float(basisForHealthInsurance * Double(healhtInsuranceContribution) / 100)
        netSalary = Float(basisForHealthInsurance) - healthInsurance
    }
    
}

enum SurvivorsPensionInsuranceType: CustomStringConvertible, Equatable, CaseIterable {
    
    case accident
    case pension
    
    var description: String {
        switch self {
        case .accident: return "wypadkowego"
        case .pension: return "rentowego"
        }
    }
    
}
