//  Created by Tymoteusz Stokarski on 12/11/2020.
//

import SwiftUI

struct NavigationButton: View {
    
    var icon: Icon
    var action: () -> ()
    
    var body: some View {
        
        Button(action: {
            action()
        }, label: {
            Image(systemName: icon.name).imageScale(.large)
        })
        
    }
    
}
