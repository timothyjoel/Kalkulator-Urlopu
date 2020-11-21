//  Created by Tymoteusz Stokarski on 21/11/2020.
//

import SwiftUI

struct SurvivorsPensionView: View {
    
    @ObservedObject var vm: SurvivorsPensionViewModel
    
    var body: some View {
        
        ScrollScreenView(title: "Renta rodzinna") {
            SectionView(title: "Podstawa prawna") {
                LinksRowView(webLinks: vm.webLinks)
            }
            SectionView(title: "Dane dotyczące renty") {
                NumericTextfieldRow(title: "Świadczenie zmarłego", textfieldUnit: .PLN, value: $vm.grossSalary, maxValue: 100000)
                StepperRowView(title: "Liczba osób uprawnionych do renty", value: $vm.numberOfPeople, range: 1...6)
                DateRowView(title: "Data nabycia prawa do renty", date: $vm.acquireDate)
            }
            SectionView(title: "Renta z ubezpieczenia") {
                GroupedRadioButtonsView(items: vm.survivorsPensionInsuranceTypes, selectedItem: $vm.pensionType)
            }
            SectionView(title: "Wynagrodzenie") {
                ResultRowView(title: "Wynagrodzenie netto", unit: "zł", result: vm.netSalary)
            }
        }
        
    }
    
}

struct SurvivorsPensionView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            SurvivorsPensionView(vm: SurvivorsPensionViewModel())
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            SurvivorsPensionView(vm: SurvivorsPensionViewModel())
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
                .environment(\.colorScheme, .dark)
        }
        
    }
    
}
