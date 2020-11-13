//  Created by Tymoteusz Stokarski on 13/11/2020.
//

import SwiftUI

protocol NavigationCoordinator {
    
    func open() -> AnyView
    
}

enum Link: NavigationCoordinator {
    
    case maternityLeaveCalculator
    case vacationLeaveCalculator
    
    func open() -> AnyView {
        switch self {
        case .maternityLeaveCalculator: return AnyView(MaternityLeaveView())
        case .vacationLeaveCalculator:  return AnyView(VacationLeaveView())
        }
    }
    
}
