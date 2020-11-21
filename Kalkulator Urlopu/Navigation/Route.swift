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
    case salaryBelow26Calculator
    case survivorsPensionCalculator
    
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
        case .salaryBelow26Calculator:
            let vm = SalaryBelow26yViewModel()
            let view = SalaryBelow26yView(vm: vm)
            return AnyView(view)
        case .survivorsPensionCalculator:
            let vm = SurvivorsPensionViewModel()
            let view = SurvivorsPensionView(vm: vm)
            return AnyView(view)
        }
    }
    
}


