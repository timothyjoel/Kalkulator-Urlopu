//  Created by Tymoteusz Stokarski on 13/11/2020.
//

import Foundation
import Combine

class SickLeaveViewModel: ObservableObject {
    
    @Published var moneyPerMonth = 3500
    @Published var daysOnSickLeave =  30
    @Published var moneyForPeriod = 2800
    @Published var percentage = 80
    
    var sickLeaveReasons = SickLeaveReason.allCases
    @Published var sickLeaveReason: SickLeaveReason = .regularSickness

    private func calculateResults() {
 //       let percentage = sickLeaveReason == .regularSickness ? self.percentage : "100"
//        moneyForPeriod = String(Double(Int(moneyPerMonth) * Int(daysOnSickLeave) * Int(percentage)))
//        regularSickness = sicknessReason == .regularSickness
//        sickWhenPregnant = sicknessReason == .sickWhenPregnant
//        accidentOnWayToWork = sicknessReason == .accidentOnWayToWork
    }
    
}

extension SickLeaveViewModel {
    
    enum SickLeaveReason: CustomStringConvertible, Equatable, CaseIterable {
        
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

