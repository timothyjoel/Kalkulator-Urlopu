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
                    SectionView(title: "Wynagrodzenie") {
                        TextfieldRowView(text: $vm.moneyPerMonth, title: "Wynagrodzenie netto", placeholder: "3500", textfieldUnit: "PLN", keyboard: .numberPad)
                            .disabled(vm.moneyPerMonth.count > 5)
                    }
                    SectionView(title: "Dni nieobecności") {
                        TextfieldRowView(text: $vm.daysOnSickLeave, title: "Okres nieobecności", placeholder: "30", textfieldUnit: "dni", keyboard: .numberPad)
                            .disabled(vm.daysOnSickLeave.count > 3)
                    }
                    SectionView(title: "Przyczyna nieobecności") {
                        GroupedRadioButtonsView(items: vm.sickLeaveReasons, selectedItem: $vm.sickLeaveReason)
                    }
                }
                
            }
            .navigationBarTitle(Text("Urlop macierzyński"))
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
