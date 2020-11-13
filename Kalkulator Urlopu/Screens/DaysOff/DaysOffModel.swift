//  Created by Tymoteusz Stokarski on 11/11/2020.
//

import Foundation

struct DaysOffQuery {
    var beginDate = Date()
    var endDate = Date()
    /// Working time as number of quarters
    var workingTime = 4
    var workedLessThanTenYears = true
}

struct DaysOffResult {
    var isValid: Bool = false
    var message: String = "Wypełnij powyższe dane"
    var daysOff: Int = 0
    var hoursOff: Int = 0
    var workedMonths: Int = 0
    var daysOffInYear: Int = 0
    var workHoursPerWeek: Int = 0
}

struct DaysOffInfo {
    
    var message: String = "Należy pamiętać że niepełny miesiąc zatrudnienia zaokrągla się do pełnego miesiąca, np. jeżeli pracownik pracował w okresie od 15 stycznia do 16 lutego, od 15 stycznia do 14 lutego przepracował dokładnie miesiąc, natomiast od 15 lutego do 16 lutego dwa dni, które zaokrągla się do pełnego miesiąca, czyli liczba przepracowanych miesięcy wynosi 2."
    var bulletPoints: [String] = ["urlopu bezpłatnego", "urlopu wychowawczego", "odbywania zasadniczej służby wojskowej lub jej form zastępczych, okresowej służby wojskowej, przeszkolenia wojskowego albo ćwiczeń wojskowych", "tymczasowego aresztowania", "odbywania kary pozbawienia wolności", "nieusprawiedliwionej nieobecności w pracy"]
    
}
