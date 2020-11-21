//  Created by Tymoteusz Stokarski on 21/11/2020.
//

import SwiftUI

struct ScrollScreenView<Content>: View where Content: View {
    
    let title: String
    let content: () -> Content

    init(title: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }

    var body: some View {
        
        ZStack {
            
            Color.customBackground.edgesIgnoringSafeArea(.all)
            ScrollView {
                content()
                Spacer()
            }
            
        }
        .navigationBarTitle(Text(title))
        
    }
    
}
