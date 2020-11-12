//  Created by Tymoteusz Stokarski on 12/11/2020.
//

import SwiftUI

struct DateRowView: View {
    
    var title: String
    @Binding var date: Date
    
    var body: some View {
        HStack {
            DatePicker(title, selection: $date, displayedComponents: .date)
                .font(.system(size: 15, weight: .semibold, design: .rounded))
                .accentColor(Color.customPink)
                .environment(\.locale, Locale.init(identifier: "pl"))
                .foregroundColor(.customLabel)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
    }
}

struct DateRowView_Previews: PreviewProvider {
    
   static var previews: some View {
    
        Group {
            DateRowView(title: "Title", date: .constant(Date()))
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")

            DateRowView(title: "Title", date: .constant(Date()))
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
      }
    
   }
    
}
