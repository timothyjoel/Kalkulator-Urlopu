//  Created by Tymoteusz Stokarski on 20/11/2020.
//

import Foundation
import SwiftUI

struct NavigationTextRow: View {
    
    var item: RoutingText
    
    var body: some View {
        
        ZStack {
            // This is a trick to make link arrow disappear in list
            NavigationLink(
                destination: item.route.open()) {
                EmptyView()
            }
            .opacity(0.0)
            HStack {
                Text(item.title)
                    .font(.text)
                    .foregroundColor(.customLabel)
                    .listRowBackground(Color.clear)
                Spacer()
            }
        }
        .listRowInsets(EdgeInsets())
        .listRowBackground(Color.customBackground)
        
    }
    
}

struct SingleTextRow_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            NavigationTextRow(item: Card(title: "Title", subtitle: "asdasd asdasd asd asd asdasd asdasd asd asd asdasasdasd asdasd asd asd asd asdasd.", image: .maternityLeave, background: [.red, .orange], route: .maternityLeaveCalculator))
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            
            NavigationTextRow(item: Card(title: "S", subtitle: "asdasd asdasd asd asd asdasd asdasd asd asd asdasasdasd asdasd asd asd asd asdasd.", image: .maternityLeave, background: [.red, .orange], route: .maternityLeaveCalculator))
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
                .environment(\.colorScheme, .dark)
        }
        
    }
    
}
