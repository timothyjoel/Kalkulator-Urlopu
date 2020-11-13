//  Created by Tymoteusz Stokarski on 12/11/2020.
//

import SwiftUI

struct SectionView<Content>: View where Content: View {
    
    let title: String
    let content: () -> Content

    init(title: String, @ViewBuilder _ content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }

    var body: some View {
        
        VStack {
            SectionHeaderView(title: title)
            VStack {
                content()
            }
            .padding(.vertical, 8)
            .background(RoundedCorners(color: .customView, corners: 10))
            .padding(.horizontal, 16)
        }
        .padding(.bottom)

    }
    
}
