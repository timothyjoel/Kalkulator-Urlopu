//  Created by Tymoteusz Stokarski.
//  Copyright (c) Tymoteusz Stokarski. All rights reserved.
//

import SwiftUI

struct SickLeaveView: View {
    
    @State var showInfo = false
    @ObservedObject var vm: SickLeaveViewModel
    
    var body: some View {

            ZStack {
                Color.customBackground.edgesIgnoringSafeArea(.all)
                ScrollView {
                    SectionView(title: "Podstawa prawna") {
                        LegalBasisRowView(law: "Ustawa zasiłkowa", webLinks: vm.webLinks)
                    }
                    SectionView(title: "Dane dotyczące zwolnienia") {
                        TextfieldRowView(value: $vm.query.moneyPerMonth, title: "Wynagrodzenie netto", textfieldUnit: "zł", keyboard: .numberPad, maximumCharacters: 5)
                        TextfieldRowView(value: $vm.query.daysOnSickLeave, title: "Okres nieobecności", textfieldUnit: "dni", keyboard: .numberPad, maximumCharacters: 3)
                        TextfieldRowView(value: $vm.query.percentage, title: "Procent wynagrodzenia", textfieldUnit: "%", keyboard: .numberPad, maximumCharacters: 3)
                    }
                    SectionView(title: "Rodzaj choroby") {
                        GroupedRadioButtonsView(items: SickLeaveReason.allCases, selectedItem: $vm.query.sickLeaveReason)
                    }
                    SectionView(title: "Wynagrodzenie") {
                        ResultRowView(title: "Netto za wybrany okres", result: vm.result)
                    }
                }
            }
            .navigationBarTitle(Text("Zwolnienie lekarskie"))
            .navigationBarItems(trailing: NavigationButton(icon: .questionMark, action: {
                self.showInfo.toggle()
            }))
        
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
