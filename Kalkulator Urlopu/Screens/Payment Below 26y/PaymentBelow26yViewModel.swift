//  Created by Tymoteusz Stokarski on 21/11/2020.
//

import Combine

class PaymentBelow26yViewModel: ObservableObject {
    
    var webLinks: [WebLink] = [WebLink(title: "Nowa preferencja w podatku dochodowym od osób fizycznych dla młodych osób", url: .ulgaPodatkowaDlaMlodych)]
    var skladkaEmerytalna = 9.76
    var skladkaRentowa = 1.5
    var skladkaChorobowa = 2.45
    var skladkaNaUbezpieczenieZdrowotne = 9
    
    @Published var grossSalary: Int = 0 {
        didSet  {
            calculateResults()
        }
    }
    
    @Published var netSalary: Float = 0
    
    func calculateResults() {
        
    }
    
}
