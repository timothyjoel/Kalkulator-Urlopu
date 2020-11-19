//  Created by Tymoteusz Stokarski on 13/11/2020.
//

import SwiftUI

struct MenuView: View {
    
    @ObservedObject var vm = MenuViewModel()
    @State var showInfo: Bool = false
    @State var searchEntry: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.customBackground.edgesIgnoringSafeArea(.all)
                VStack (spacing: 8) {
                    SearchBar(placeholder: "Wprowadź nazwę kalkulatora...", text: $searchEntry)
                        .padding(.horizontal, 10)
                    CustomList(title: "Kalkulatory") {
                        ForEach(self.vm.cards.filter({ card -> Bool in
                            searchEntry.isEmpty ? true : card.title.lowercased()
                                .contains(searchEntry.lowercased())
                        }), id: \.self) { card in
                            MenuCardView(card: card)
                                .buttonStyle(PlainButtonStyle())
                                .background(Color.red, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                    }
                  //  Spacer()
                }
            }
            .navigationBarItems(trailing: NavigationButton(icon: .questionMark, action: { self.showInfo.toggle() })
            )
        }
        .edgesIgnoringSafeArea(.all)
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
