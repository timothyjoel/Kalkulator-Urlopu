//  Created by Tymoteusz Stokarski on 13/11/2020.
//

import SwiftUI

struct InfoView<Content>: View where Content: View {
    
    var title: String
    @Binding var show: Bool
    var content: () -> Content
    
    init(title: String = "Informacja", show: Binding<Bool>, @ViewBuilder _ content: @escaping () -> Content) {
        self.title = title
        self.content = content
        self._show = show
    }
    
    var body: some View {
        
        ZStack {
                VStack {
                    Spacer()
                    VStack{}
                        .frame(width: UIScreen.width, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.customView)
                }
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 0) {

                    HStack {
                        Spacer()
                        Text(title)
                            .foregroundColor(.customPink)
                            .font(.boldedText)
                        Spacer()
                    }

                    .padding(.top, 16)
                    .padding(.bottom, 8)
                    content()
                    
                     //   .offset(y: -40)
                    HStack {
                        Spacer()
                        Button(action: {
                            self.show.toggle()
                        }, label: {
                            Text("Zamknij")
                                .font(.text)
                                .foregroundColor(.blue)
                        })
                        .padding(.vertical, 16)
                        Spacer()
                    }

                }
                .background(RoundedCorners(color: .customView, tl: 30, tr: 30, bl: 0, br: 0))
                
            }

        }
        
    }
}

struct InfoMessageRow: View {
    
    var message: String
    
    var body: some View {
        
        Text(message)
            .foregroundColor(.customLabel)
            .font(.text)
            .padding(.horizontal)
        
    }
    
}

struct InfoBulletPointsRow: View {
    
    var bulletPoints: [String]
    
    var body: some View {
        
        VStack (alignment: .leading) {
            ForEach(bulletPoints, id: \.self) { text in
                Text("•  " + text)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .foregroundColor(.customLabel)
                    .font(.text)
                    .padding(.trailing)
                    .padding(.leading, 24)
            }
        }
        .padding(.top)
        
    }
    
}

struct InfoView_Previews: PreviewProvider {

   static var previews: some View {

        Group {
            InfoView(show: .constant(true)) {
                InfoMessageRow(message: "Niepełny miesiąc zatrudnienia zaokrągla się do pełnego miesiąca - jeżeli pracownik był zatrudniony w okresie od 15 stycznia do 16 lutego, od 15 stycznia do 14 lutego przepracował dokładnie miesiąc, natomiast od 15 lutego do 16 lutego dwa dni, które zaokrąglane są do pełnego miesiąca. Liczba przepracowanychc miesięcy wynoosi 2. Z okresu zatrudniena należy wyłączyć:")
                InfoBulletPointsRow(bulletPoints: ["bezpłatny urlop", "urlop wychowawczy", "odbywanie zasadniczej służby wojskowej", "okresowa służba wojskowa", "szkolenia lub ćwiczenia wojskowe", "tymczasowy areszt", "odbywanie kary pozbawienia wolności", "nieusprawiedliwiona nieobecność w pracy"])
            }
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")

            InfoView(show: .constant(true)) {
                InfoMessageRow(message: "Niepełny miesiąc zatrudnienia zaokrągla się do pełnego miesiąca - jeżeli pracownik był zatrudniony w okresie od 15 stycznia do 16 lutego, od 15 stycznia do 14 lutego przepracował dokładnie miesiąc, natomiast od 15 lutego do 16 lutego dwa dni, które zaokrąglane są do pełnego miesiąca. Liczba przepracowanychc miesięcy wynoosi 2. Z okresu zatrudniena należy wyłączyć:")
                InfoBulletPointsRow(bulletPoints: ["bezpłatny urlop", "urlop wychowawczy", "odbywanie zasadniczej służby wojskowej", "okresowa służba wojskowa", "szkolenia lub ćwiczenia wojskowe", "tymczasowy areszt", "odbywanie kary pozbawienia wolności", "nieusprawiedliwiona nieobecność w pracy"])
            }
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
                .environment(\.colorScheme, .dark)
      }

   }

}
