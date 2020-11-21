//  Created by Tymoteusz Stokarski on 13/11/2020.
//

import Combine

class MenuViewModel: ObservableObject {
    
    var cards = [
        Card(title: "Urlop macierzyński", subtitle: "Kalkulator oblicza pełny okres należnych urlopów z tytułu macierzyństwa na warunkach urlopu macierzyńskiego oraz urlopu rodzicielskiego.", image: .girl, background: [.customView, .customView], route: .maternityLeaveCalculator),
        Card(title: "Urlop wypoczynkowy", subtitle: "Kalkulator oblicza wymiar dostępnego urlopu w przypadku nawiązania/rozwiązania przez pracownika stosunku pracy w trakcie roku kalendarzowego.", image: .work1, background: [.customView, .customView], route: .vacationLeaveCalculator),
        Card(title: "Wynagrodzenie chorobowe", subtitle: "Kalkulator wynagrodzenia chorobowego oblicza wysokość wynagrodzenia za czas niezdolności do pracy z powodu choroby.", image: .sick, background: [.customView, .customView], route: .sickLeaveCalculator),
        Card(title: "Wynagrodzenie - poniżej 26 lat", subtitle: "Kalkulator oblicza wynagrodzenie netto dla przychodów otrzymanych przez podatnika do ukończenia 26 roku życia.", image: .moneyFromBox, background: [.customView, .customView], route: .salaryBelow26Calculator),
        Card(title: "Renta rodzinna", subtitle: "Kalkulator pozwala na ustalenie wysokości renty rodzinnej.", image: .family, background: [.customView, .customView], route: .survivorsPensionCalculator)
        ]
    
}
