//  Created by Tymoteusz Stokarski on 12/11/2020.
//

import SwiftUI

struct ToggleRowView: View {
    
    var title: String
    @Binding var isOn: Bool
    
    var body: some View {
        VStack {
            Toggle(title, isOn: $isOn)
                .font(.system(size: 15, weight: .semibold, design: .rounded))
                .toggleStyle(SwitchToggleStyle(tint: .blue))
                .environment(\.locale, Locale.init(identifier: "pl"))
                .foregroundColor(.customLabel)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
    }
}

struct ToggleRowView_Previews: PreviewProvider {
    
   static var previews: some View {
    
        Group {
            ToggleRowView(title: "Title", isOn: .constant(true))
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")

            ToggleRowView(title: "Title", isOn: .constant(true))
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
      }
    
   }
    
}
