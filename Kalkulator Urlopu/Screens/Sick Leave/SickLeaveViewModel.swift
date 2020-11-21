//  Created by Tymoteusz Stokarski on 13/11/2020.
//

import Foundation
import Combine

class SickLeaveViewModel: ObservableObject {
    
    var webLinks: [WebLink] = [
        WebLink(title: "Ustawa o świadczeniach pieniężnych z ubezpieczenia społecznego w razie choroby i macierzyństwa", url: .leaveBenefits)
    ]
    
    @Published var query = SickLeaveQuery() {
        didSet {
            calculateResult()
        }
    }
    @Published var result: Float = 0
    @Published var resultPerDay: Float = 0

    private func calculateResult() {
        let percentage = query.sickLeaveReason == .regularSickness ? 80 : 100
        result = Float(Double(percentage)/100 * Double(query.daysOnSickLeave) * Double(query.moneyPerMonth) / 30)
        resultPerDay = result == 0 ? 0 : Float(Double(result) / Double(query.daysOnSickLeave))
    }
    
}

enum SickLeaveReason: StringDescriptiveItem {
    
    case regularSickness
    case sickWhenPregnant
    case accidentOnWayToWork
    
    var description: String {
        switch self {
        case .regularSickness: return "Normalne zwolnienie lekarskie"
        case .sickWhenPregnant: return "Choroba w ciąży"
        case .accidentOnWayToWork: return "Wypadek w drodze do/z pracy"
        }
    }
    
}


