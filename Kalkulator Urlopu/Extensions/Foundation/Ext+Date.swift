//  Created by Tymoteusz Stokarski on 12/11/2020.
//

import Foundation

extension Date {
    
    init(day: Int, month: Int, year: Int) {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = 12
        dateComponents.minute = 0
        self = Calendar.current.date(from: dateComponents)!
    }
    
}

extension Date {
    
    var stringDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.string(from: self)
    }
    
}
