//  Created by Tymoteusz Stokarski on 13/11/2020.
//

import Combine

class MaternityLeaveViewModel: ObservableObject {
    
    @Published var query = MaternityLeaveQuery() {
        didSet {
            result.isValid = true
        }
    }
    
    @Published var result = MaternityLeaveResult()
    
    var info = MaternityLeaveInfo()
    
}
