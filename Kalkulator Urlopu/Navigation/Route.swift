//  Created by Tymoteusz Stokarski on 13/11/2020.
//

import SwiftUI

protocol Router {
    
    func open() -> AnyView
    
}

enum Route: Router {
    
    case maternityLeaveCalculator
    case vacationLeaveCalculator
    case sickLeaveCalculator
    
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
        case .sickLeaveCalculator:
            let vm = SickLeaveViewModel()
            let view = SickLeaveView(vm: vm)
            return AnyView(view)
        }
    }
    
}


