//  Created by Tymoteusz Stokarski on 12/11/2020.
//

import SwiftUI

struct ResultRowView: View {
    
    var title: String
    var result: Any
    
    var body: some View {
        HStack {
            Text(title)
                .font(.text)
                .foregroundColor(.customLabel)
                .padding(8)
            Spacer()
            Text(String(describing: result))
                .multilineTextAlignment(.leading)
                .font(.text)
                .foregroundColor(.blue)
                .padding(8)
                
        }
        .padding(.vertical, 4)
        .padding(.horizontal, 8)
    }
    
}

struct ResultRowView_Previews: PreviewProvider {
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
