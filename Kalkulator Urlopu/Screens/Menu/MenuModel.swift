//  Created by Tymoteusz Stokarski on 13/11/2020.
//

import SwiftUI

struct MenuCard {

    var title: String
    var subtitle: String
    var image: MenuCardImage
    var background: [Color]
    var route: Route
    
}

extension MenuCard: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.title)
        hasher.combine(self.subtitle)
    }
    
}

extension MenuCard: Equatable {
    static func == (lhs: MenuCard, rhs: MenuCard) -> Bool {
        lhs.title == rhs.title && lhs.subtitle == lhs.subtitle && lhs.image == rhs.image
    }
}
