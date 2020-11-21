//  Created by Tymoteusz Stokarski.
//  Copyright (c) Tymoteusz Stokarski. All rights reserved.
//

import SwiftUI

struct SickLeaveView: View {
    
    @ObservedObject var vm: SickLeaveViewModel
    
    var body: some View {
        
        ScrollScreenView(title: "Zwolnienie lekarskie") {
            SectionView(title: "Podstawa prawna") {
                LinksRowView(webLinks: vm.webLinks)
            }
            SectionView(title: "Dane dotyczące zatrudnienia") {
                NumericTextfieldRow(title: "Wynagrodzenie netto", textfieldUnit: "zł", value: $vm.query.moneyPerMonth, keyboard: .numberPad, maxValue: 100000)
                NumericTextfieldRow(title: "Okres nieobecności", textfieldUnit: "dni", value: $vm.query.daysOnSickLeave, keyboard: .numberPad, maxValue: 365)
            }
            SectionView(title: "Rodzaj zwolnienia") {
                GroupedRadioButtonsView(items: SickLeaveReason.allCases, selectedItem: $vm.query.sickLeaveReason)
            }
            SectionView(title: "Wysokosć zwolnienia") {
                ResultRowView(title: "Netto za wybrany okres", unit: "zł", result: vm.result)
                ResultRowView(title: "Netto za dzień", unit: "zł", result: vm.resultPerDay)
            }
        }
    }
    
}


struct SickLeaveView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            SickLeaveView(vm: SickLeaveViewModel())
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            SickLeaveView(vm: SickLeaveViewModel())
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
                .environment(\.colorScheme, .dark)
        }
        
    }
    
}
