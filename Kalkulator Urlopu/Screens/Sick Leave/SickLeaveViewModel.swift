//  Created by Tymoteusz Stokarski on 13/11/2020.
//

import Foundation
import Combine

class SickLeaveViewModel: ObservableObject {
    
    @Published var moneyPerMonth = "3500"
    @Published var daysOnSickLeave =  "30"
    @Published var moneyForPeriod = "2800"
    
    var sickLeaveReasons = SickLeaveReason.allCases
    @Published var sickLeaveReason: SickLeaveReason = .regularSickness
//
//    @Published var regularSickness: Bool = true
//     {
//        didSet {
//            sicknessReason = .regularSickness
//            calculateResults()
//        }
//    }
//    @Published var sickWhenPregnant: Bool = false
//    {
//        didSet {
//            sicknessReason = .sickWhenPregnant
//            calculateResults()
//        }
//    }
//    @Published var accidentOnWayToWork: Bool = false
//    {
//        didSet {
//            sicknessReason = .accidentOnWayToWork
//            calculateResults()
//        }
//    }
//
//    var sicknessReason: SickLeaveReason = .regularSickness
    
    private func calculateResults() {
//        regularSickness = sicknessReason == .regularSickness
//        sickWhenPregnant = sicknessReason == .sickWhenPregnant
//        accidentOnWayToWork = sicknessReason == .accidentOnWayToWork
    }
    
}

extension SickLeaveViewModel {
    
    enum SickLeaveReason: StringDescriptive, Equatable, CaseIterable {
        
        case regularSickness
        case sickWhenPregnant
        case accidentOnWayToWork
        
        var description: String {
            switch self {
            case .regularSickness: return "Choroba"
            case .sickWhenPregnant: return "Choroba w ciąży"
            case .accidentOnWayToWork: return "Wypadek w drodze do/z pracy"
            }
        }
        
    }
    
}

