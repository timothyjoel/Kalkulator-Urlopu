//  Created by Tymoteusz Stokarski on 13/11/2020.
//

import Foundation
import Combine

class SickLeaveViewModel: ObservableObject {
    
    var webLinks: [WebLink] = [
        WebLink(title: "Ustawa o świadczeniach pieniężnych z ubezpieczenia społecznego w razie choroby i macierzyństwa", url: .leaveBenefits)
    ]
    
    @Published var query = SickLeaveQuery(moneyPerMonth: 3500, daysOnSickLeave: 30, percentage: 80, sickLeaveReason: .regularSickness) {
        didSet {
            calculateResult()
        }
    }
    @Published var result: Double = 2800
    @Published var resultPerDay: Double = 800

    private func calculateResult() {
        let percentage = query.sickLeaveReason == .regularSickness ? self.query.percentage : 100
        result = Double(percentage)/100 * Double(query.daysOnSickLeave) * Double(query.moneyPerMonth) / 30
        resultPerDay = result / Double(query.daysOnSickLeave)
    }
    
}

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


