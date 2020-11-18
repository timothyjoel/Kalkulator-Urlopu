//  Created by Tymoteusz Stokarski on 12/11/2020.
//

import SwiftUI

struct InfoRowView<Content>: View where Content: View {
    
    let content: () -> Content

    init(@ViewBuilder _ content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        HStack {
            VStack {
                content()
            }
            .padding(8)
            .multilineTextAlignment(.leading)
        }
        .padding(.vertical, 4)
        .padding(.horizontal, 8)
    }
    
}

struct InfoRowView_Previews: PreviewProvider {
    
   static var previews: some View {
    
        Group {
            ResultRowView(title: "Title", result: "0")
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")

            ResultRowView(title: "Title", result: "0")
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
                .environment(\.colorScheme, .dark)
      }
    
   }
    
}
