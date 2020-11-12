//  Created by Tymoteusz Stokarski on 12/11/2020.
//

import SwiftUI

struct StepperRowView: View {
    
    var title: String
    @Binding var value: Int
    
    var body: some View {
        HStack {
            Stepper(title, value: $value)
                .font(.system(size: 15, weight: .semibold, design: .rounded))
                .environment(\.locale, Locale.init(identifier: "pl"))
                .foregroundColor(.customLabel)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
    }
}

struct StepperRowView_Previews: PreviewProvider {
    
   static var previews: some View {
    
        Group {
            StepperRowView(title: "Title", value: .constant(10))
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")

            StepperRowView(title: "Title", value: .constant(10))
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
      }
    
   }
    
}
