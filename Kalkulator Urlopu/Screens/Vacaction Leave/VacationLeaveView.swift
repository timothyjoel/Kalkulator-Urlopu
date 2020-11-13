//  Created by Tymoteusz Stokarski on 03/11/2020.
//

import Combine
import SwiftUI

struct VacationLeaveView: View {
    
    @State var showInfo = false
    @ObservedObject var vm = VacationLeaveViewModel()
    
    var body: some View {

            ZStack {
                Color.customBackground.edgesIgnoringSafeArea(.all)
                BackgroundBottomAnimationView(show: $vm.result.isValid)
                    .blur(radius: self.showInfo ? 10 : 0)
                    .animation(nil)
                ScrollView {
                    SectionView(title: "Dane dotyczące zatrudnienia") {
                        ToggleRowView(title: "Staż pracy poniżej 10 lat", isOn: $vm.query.workedLessThanTenYears)
                        DateRowView(title: "Początek", date: $vm.query.beginDate)
                        DateRowView(title: "Koniec", date: $vm.query.endDate)
                        StepperRowView(title: "Wymiar etatu: \(vm.query.workingTime)/4", value: $vm.query.workingTime, range: vm.query.workingTimeRange)
                    }
                    SectionView(title: "Zakres urlopu") {
                        ResultRowView(title: "Liczba dni wolnych za wybrany okres:", result: vm.result.daysOff)
                        ResultRowView(title: "Godzinowy wymiar urlopu:", result: vm.result.hoursOff)
                        ResultRowView(title: "Liczba przepracowanych miesięcy:", result: vm.result.workedMonths)
                        ResultRowView(title: "Wymiar roczny dla pełnego etatu:", result: vm.result.daysOffInYear)
                        ResultRowView(title: "Liczba godzin pracy w tygodniu:", result: vm.result.workHoursPerWeek)
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
            .navigationBarTitle(Text("Urlop wypoczynkowy"))
            .navigationBarItems(trailing: NavigationButton(icon: .questionMark, action: {
                self.showInfo.toggle()
            }))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    
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

struct BackgroundBottomAnimationView: View {
    
    @Binding var show: Bool
    
    var body: some View {
        VStack {
            Spacer()
            LottieAnimationView(.checkList)
                .scaleEffect(0.9)
                .scaledToFit()
                .offset(x: 0, y: 40.0)
        }
        .offset(x: 0, y: !show ? 0 : UIScreen.height)
        .animation(.spring())
    }
    
}
