//  Created by Tymoteusz Stokarski on 13/11/2020.
//

import Combine
import SwiftUI

struct MaternityLeaveView: View {
    
    @ObservedObject var vm: MaternityLeaveViewModel
    
    var body: some View {
        
        ScrollScreenView(title: "Urlop macierzyński") {
            SectionView(title: "Podstawa prawna") {
                LinksRowView(webLinks: vm.webLinks)
            }
            SectionView(title: "Dane dotyczące urlopu") {
                DateRowView(title: "Data porodu", date: $vm.query.birthDate)
                NumericTextfieldRow(title: "Liczba urodzonych dzieci podczas porodu", value: $vm.query.numberOfKidsBorn, maxValue: 5)
            }
            SectionView(title: "Urlop macierzyński") {
                ResultRowView(title: "Liczba tygodni:", result: vm.result.maternityLeave)
                ResultRowView(title: "Data rozpoczęcia:", result: vm.result.maternityLeaveStartDate)
                ResultRowView(title: "Data zakończenia:", result: vm.result.maternityLeaveFinishDate)
            }
            SectionView(title: "Urlop rodzicielski") {
                ResultRowView(title: "Liczba tygodni:", result: vm.result.parentalLeave)
                ResultRowView(title: "Data rozpoczęcia:", result: vm.result.parentalLeaveStartDate)
                ResultRowView(title: "Data zakończenia:", result: vm.result.parentalLeaveFinishDate)
            }
        }
        
    }
    
}

struct MaternityLeaveView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            MaternityLeaveView(vm: MaternityLeaveViewModel())
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            
            MaternityLeaveView(vm: MaternityLeaveViewModel())
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
                .environment(\.colorScheme, .dark)
        }
        
    }
    
}
