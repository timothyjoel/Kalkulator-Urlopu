//  Created by Tymoteusz Stokarski on 13/11/2020.
//

import Combine
import SwiftUI

struct MaternityLeaveView: View {
    
    @State var showInfo = false
    @ObservedObject var vm = MaternityLeaveViewModel()
    
    var body: some View {

            ZStack {
                Color.customBackground.edgesIgnoringSafeArea(.all)
                BackgroundBottomAnimationView(show: $vm.result.isValid)
                    .blur(radius: self.showInfo ? 10 : 0)
                    .animation(nil)
                ScrollView {
                    SectionView(title: "Dane dotyczące urlopu") {
                        DateRowView(title: "Data porodu", date: $vm.query.birthDate)
                        StepperRowView(title: "Liczba urodzonych dzieci podczas porodu: \(vm.query.numberOfKidsBorn)", value: $vm.query.numberOfKidsBorn, range: vm.query.numberOfKidsBornRange)
                    }
                    SectionView(title: "Zakres urlopu w tygodniach") {
                        ResultRowView(title: "Urlop macierzyński:", result: vm.result.maternityLeave)
                        ResultRowView(title: "Urlop rodzicielski:", result: vm.result.parentalLeave)
                        ResultRowView(title: "Urlop łącznie:", result: vm.result.summedLeave)
                        ResultRowView(title: "Data rozpoczęcia:", result: vm.result.summedLeave)
                        ResultRowView(title: "Data zakończenia:", result: vm.result.summedLeave)
                    }
                    .offset(x: 0, y: vm.result.isValid ? 0 : UIScreen.height)
                    .animation(.spring())
                    Spacer()
                }
                .allowsHitTesting(!showInfo)
                .blur(radius: self.showInfo ? 10 : 0)
                InfoView(show: $showInfo) {
                    InfoMessageRow(message: vm.info.message)
                    InfoBulletPointsRow(bulletPoints: vm.info.bulletPoints)
                }
                .animation(.spring())
                .offset(x: 0, y: showInfo ? 0 : UIScreen.height )
                
            }
            .navigationBarTitle(Text("Urlop macierzyński"))
            .navigationBarItems(trailing: NavigationButton(icon: .questionMark, action: {
                self.showInfo.toggle()
            }))
        
    }
}

struct MaternityLeaveView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            VacationLeaveView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            
            VacationLeaveView()
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
                .environment(\.colorScheme, .dark)
        }
        
    }
    
}
