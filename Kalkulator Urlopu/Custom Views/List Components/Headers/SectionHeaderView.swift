//  Created by Tymoteusz Stokarski on 12/11/2020.
//

import SwiftUI

struct SectionHeaderView: View {
    
    var title: String
    
    var body: some View {
        HStack() {
            Text(title)
                .font(.header)
                .foregroundColor(.customSectionTitle)
                .padding(.horizontal)
                .padding(.top, 8)
                .padding(.bottom, 4)
            Spacer()
        }
    }
}

struct SectionHeaderView_Previews: PreviewProvider {
    
   static var previews: some View {
    
        Group {
            SectionHeaderView(title: "Title")
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")

            SectionHeaderView(title: "Title")
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
                .environment(\.colorScheme, .dark)
      }
    
   }
    
}
