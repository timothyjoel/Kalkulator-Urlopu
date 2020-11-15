//  Created by Tymoteusz Stokarski on 12/11/2020.
//

import SwiftUI

struct StepperRowView: View {
    
    var title: String
    @Binding var value: Int
    var range: ClosedRange<Int>
    
    var body: some View {
        
        Stepper(title, value: $value, in: range)
            .font(.text)
            .foregroundColor(.customLabel)
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
        
    }
    
}

struct StepperRowView_Previews: PreviewProvider {
    
   static var previews: some View {
    
        Group {
            StepperRowView(title: "Title", value: .constant(10), range: 1...4)
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")

            StepperRowView(title: "Title", value: .constant(10), range: 1...4)
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
                .environment(\.colorScheme, .dark)
      }
    
   }
    
}
