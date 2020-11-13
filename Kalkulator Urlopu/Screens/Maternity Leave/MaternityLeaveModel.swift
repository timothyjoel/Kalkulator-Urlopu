//  Created by Tymoteusz Stokarski on 13/11/2020.
//

import Foundation

struct MaternityLeaveQuery {
    var birthDate = Date()
    var numberOfKidsBorn = 4
    var numberOfKidsBornRange = 1...5
}

struct MaternityLeaveResult {
    typealias Week = Int
    var maternityLeave: Week = 0
    var parentalLeave: Week = 0
    var summedLeave: Week = 0
    var isValid: Bool = false
}

struct MaternityLeaveInfo {
    
    var message: String = "Niepełny miesiąc zatrudnienia zaokrągla się do pełnego miesiąca - jeżeli pracownik był zatrudniony w okresie od 15 stycznia do 16 lutego, od 15 stycznia do 14 lutego przepracował dokładnie miesiąc, natomiast od 15 lutego do 16 lutego dwa dni, które zaokrąglane są do pełnego miesiąca. Liczba przepracowanychc miesięcy wynoosi 2. Z okresu zatrudniena należy wyłączyć:"
    var bulletPoints: [String] = ["bezpłatny urlop", "urlop wychowawczy", "odbywanie zasadniczej służby wojskowej", "okresowa służba wojskowa", "szkolenia lub ćwiczenia wojskowe", "tymczasowy areszt", "odbywanie kary pozbawienia wolności", "nieusprawiedliwiona nieobecność w pracy"]
    
}
