//  Created by Tymoteusz Stokarski on 13/11/2020.
//

import Combine

class MenuViewModel: ObservableObject {
    
    var cards = [
        MenuCard(title: "Urlop macierzyński", subtitle: "Kalkulator oblicza pełny okres należnych urlopów z tytułu macierzyństwa na warunkach urlopu macierzyńskiego oraz urlopu rodzicielskiego.", image: .maternityLeave, background: [.customView, .customView], route: .maternityLeaveCalculator),
        MenuCard(title: "Urlop wypoczynkowy", subtitle: "Kalkulator oblicza wymiar dostępnego urlopu w przypadku nawiązania/rozwiązania przez pracownika stosunku pracy w trakcie roku kalendarzowego.", image: .work1, background: [.customView, .customView], route: .vacationLeaveCalculator),
        MenuCard(title: "Wynagrodzenie chorobowe", subtitle: "Kalkulator wynagrodzenia chorobowego oblicza wysokość wynagrodzenia za czas niezdolności do pracy z powodu choroby.", image: .sick, background: [.customView, .customView], route: .sickLeaveCalculator)
        ]
    
}
