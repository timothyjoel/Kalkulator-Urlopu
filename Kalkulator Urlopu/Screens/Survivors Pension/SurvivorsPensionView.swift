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
                NumericTextfieldRow(title: "Świadczenie zmarłego", textfieldUnit: .PLN, value: $vm.query.moneyAmount, maxValue: 100000)
                NumericTextfieldRow(title: "Osoby uprawnione do renty", textfieldUnit: .number, value: $vm.query.numberOfPeople, maxValue: 6, minValue: 1)
            }
            SectionView(title: "Renta z ubezpieczenia") {
                GroupedRadioButtonsView(items: vm.survivorsPensionInsuranceTypes, selectedItem: $vm.query.pensionType)
            }
            SectionView(title: "Renta rodzinna z ubezpieczenia rentowego") {
                ResultRowView(title: "Wysokość świadczenia osoby zmarłej", unit: "%", result: vm.result.percentage)
                ResultRowView(title: "Obliczona", unit: "zł", result: vm.result.calculatedAmount)
                ResultRowView(title: "Gwarantowana", unit: "zł", result: vm.result.guaranteedAmount)
                ResultRowView(title: "Należna", unit: "zł", result: vm.result.dueAmount)
                ResultRowView(title: "Należna na osobę", unit: "zł", result: vm.result.dueAmountPerPerson)
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
