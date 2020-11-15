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
        case .maternityLeaveCalculator:
            let vm = MaternityLeaveViewModel()
            let view = MaternityLeaveView(vm: vm)
            return AnyView(view)
        case .vacationLeaveCalculator:
            let vm = VacationLeaveViewModel()
            let view = VacationLeaveView(vm: vm)
            return AnyView(view)
        }
    }
    
}
