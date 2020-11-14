//  Created by Tymoteusz Stokarski on 11/11/2020.
//

import Foundation

struct VacationLeaveQuery {
    var beginDate = Date()
    var endDate = Date()
    /// Working time as number of quarters
    var workingTime = 4
    var workingTimeRange = 1...4
    var workedLessThanTenYears = true
}

struct VacationLeaveResult {
    var isValid: Bool = false
    var message: String = "Wypełnij powyższe dane"
    var daysOff: Int = 0
    var hoursOff: Int = 0
    var workedMonths: Int = 0
    var daysOffInYear: Int = 0
    var workHoursPerWeek: Int = 0
}

struct VacationLeaveInfo {
    
    var message: String = "Niepełny miesiąc zatrudnienia zaokrągla się do pełnego miesiąca - jeżeli pracownik był zatrudniony w okresie od 15 stycznia do 16 lutego, od 15 stycznia do 14 lutego przepracował dokładnie miesiąc, natomiast od 15 lutego do 16 lutego dwa dni, które zaokrąglane są do pełnego miesiąca. Liczba przepracowanych miesięcy wynosi 2. Z okresu zatrudniena należy wyłączyć:"
    var bulletPoints: [String] = ["bezpłatny urlop", "urlop wychowawczy", "odbywanie zasadniczej służby wojskowej", "okresowa służba wojskowa", "szkolenia lub ćwiczenia wojskowe", "tymczasowy areszt", "odbywanie kary pozbawienia wolności", "nieusprawiedliwiona nieobecność w pracy"]
    
}
