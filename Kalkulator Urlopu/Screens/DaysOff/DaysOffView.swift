//  Created by Tymoteusz Stokarski on 03/11/2020.
//

import Combine
import SwiftUI

struct DaysOffView: View {
    
    @ObservedObject var vm = DaysOffViewModel()
    
    var body: some View {
        ZStack {
            Color.customBackground.edgesIgnoringSafeArea(.all)
            BackgroundBottomAnimationView(show: $vm.result.isValid)
            ScrollView {
                    SectionView(title: "Zatrudnienie") {
                        ToggleRowView(title: "Staż pracy poniżej 10 lat", isOn: $vm.query.workedLessThanTenYears)
                        DateRowView(title: "Początek", date: $vm.query.beginDate)
                        DateRowView(title: "Koniec", date: $vm.query.endDate)
                        StepperRowView(title: "Wymiar etatu: \(vm.query.workingTime)/4", value: $vm.query.workingTime)
                    }
                    SectionView(title: vm.result.message) {
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
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    
   static var previews: some View {
    
        Group {
            DaysOffView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")

            DaysOffView()
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
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
