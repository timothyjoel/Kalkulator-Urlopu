//  Created by Tymoteusz Stokarski on 21/11/2020.
//

import Combine
import SwiftUI

struct SalaryBelow26yView: View {
    
    @ObservedObject var vm: SalaryBelow26yViewModel
    
    var body: some View {

        ZStack {
            Color.customBackground.edgesIgnoringSafeArea(.all)
            ScrollView {
                SectionView(title: "Podstawa prawna") {
                    LinksRowView(webLinks: vm.webLinks)
                }
                SectionView(title: "Dane dotyczące zatrudnienia") {
                    NumericTextfieldRow(title: "Wynagrodzenie brutto", textfieldUnit: "zł", value: $vm.grossSalary, keyboard: .numberPad, maxValue: 100000)
                    ResultRowView(title: "Składka emerytalna", unit: "%", result: vm.pensionContribution1)
                    ResultRowView(title: "Składka rentowa", unit: "%", result: vm.pensionContribution2)
                    ResultRowView(title: "Składka chorobowa", unit: "%", result: vm.sicknessContribution)
                    ResultRowView(title: "Składka na ubezpieczenie zdrowotne", unit: "%", result: vm.healhtInsuranceContribution)
                }
                
                SectionView(title: "Wynagrodzenie") {
                    ResultRowView(title: "Wynagrodzenie netto", unit: "zł", result: vm.netSalary)
                }

                Spacer()
            }
        }
        .navigationBarTitle(Text("Wynagrodzenie"))

    }
}

struct SalaryBelow26yView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            SalaryBelow26yView(vm: SalaryBelow26yViewModel())
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            
            SalaryBelow26yView(vm: SalaryBelow26yViewModel())
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
                .environment(\.colorScheme, .dark)
        }
        
    }
    
}
