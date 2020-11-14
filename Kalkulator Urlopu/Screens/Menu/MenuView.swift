//  Created by Tymoteusz Stokarski on 13/11/2020.
//

import SwiftUI

struct MenuView: View {
    
    @ObservedObject var vm = MenuViewModel()
    @State var showInfo: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.customBackground.edgesIgnoringSafeArea(.all)
                List {
                    ForEach(vm.cards, id: \.self) { card in
                        MenuCardView(card: card)
                            .buttonStyle(PlainButtonStyle())
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .background(Color.red)
                .navigationBarTitle(Text("Kalkulatory"))
                .navigationBarItems(trailing: NavigationButton(icon: .questionMark, action: {
                    self.showInfo.toggle()
                }))
            }
        }.edgesIgnoringSafeArea(.all)
    }
    
}

struct MenuView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            MenuView(showInfo: false)
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            MenuView(showInfo: false)
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
                .environment(\.colorScheme, .dark)
        }
        
    }
}
