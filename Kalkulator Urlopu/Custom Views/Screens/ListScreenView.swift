//  Created by Tymoteusz Stokarski on 15/11/2020.
//

import SwiftUI

struct ListScreenView<Content>: View where Content: View {
    
    let title: String
    let content: () -> Content

    init(title: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }

    var body: some View {
        
        ZStack {
            Color.customBackground.edgesIgnoringSafeArea(.all)
            List {
                content()
            }
            .background(Color.customBackground)
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle(Text(title))
        }

    }
    
}
