//  Created by Tymoteusz Stokarski on 03/11/2020.
//

import Combine
import SwiftUI

struct VacationLeaveView: View {
    
    @ObservedObject var vm: VacationLeaveViewModel
    
    var body: some View {
        
        ScrollScreenView(title: "Urlop wypoczynkowy") {
            SectionView(title: "Podstawa prawna") {
                LinksRowView(webLinks: vm.webLinks)
            }
            SectionView(title: "Dane dotyczące zatrudnienia") {
                ToggleRowView(title: "Staż pracy poniżej 10 lat", isOn: $vm.query.workedLessThanTenYears)
                DateRowView(title: "Początek", date: $vm.query.beginDate)
                DateRowView(title: "Koniec", date: $vm.query.endDate)
                StepperRowView(title: "Wymiar etatu: \(vm.query.workingTime)/4", value: $vm.query.workingTime, range: vm.query.workingTimeRange)
            }
            SectionView(title: "Zakres urlopu") {
                ResultRowView(title: "Liczba dni wolnych za wybrany okres:", result: vm.result.daysOff ?? 0)
                ResultRowView(title: "Godzinowy wymiar urlopu:", result: vm.result.hoursOff ?? 0)
                ResultRowView(title: "Liczba przepracowanych miesięcy:", result: vm.result.workedMonths ?? 0)
                ResultRowView(title: "Wymiar roczny dla pełnego etatu:", result: vm.result.daysOffInYear ?? 0)
                ResultRowView(title: "Liczba godzin pracy w tygodniu:", result: vm.result.workHoursPerWeek ??  0)
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            VacationLeaveView(vm: VacationLeaveViewModel())
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            
            VacationLeaveView(vm: VacationLeaveViewModel())
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
