//  Created by Tymoteusz Stokarski on 13/11/2020.
//

import Foundation
import Combine

class SickLeaveDailyPaymentViewModel: ObservableObject {
    
//    @Published var query = SickLeaveDailyPaymentQuery()
//    @Published var result: Double = 2800
//
//    private func calculateResult() {
//        let percentage = query.sickLeaveReason == .regularSickness ? self.query.percentage : 10
//        result = Double(percentage)/100 * Double(query.daysOnSickLeave) * Double(query.moneyPerMonth) / 30
//    }
    
}

enum SickLeaveDailyPaymentReason: CustomStringConvertible, Equatable, CaseIterable {
    
    case sicknessPay
    case sicknessAllowance
    case rehabilitationAllowance
    case maternityAllowance
    case careAllowance
    
    var description: String {
        switch self {
        case .sicknessPay: return "Wynagrodzenie chorobwe"
        case .sicknessAllowance: return "Zasiłek chorobowy"
        case .rehabilitationAllowance: return "ŚwiadzeneRehabilitacyjne"
        case .maternityAllowance: return "Zasiłek macierzyński"
        case .careAllowance: return "Zasiłek opiekuńczy"
        }
    }
    
}
