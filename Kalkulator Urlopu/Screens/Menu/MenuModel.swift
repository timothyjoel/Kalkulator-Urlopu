//  Created by Tymoteusz Stokarski on 13/11/2020.
//

import SwiftUI

struct Card {

    var title: String
    var subtitle: String
    var image: CardImage
    var background: [Color]
    var route: Route
    
}

extension Card: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.title)
        hasher.combine(self.subtitle)
    }
    
}

extension Card: Equatable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        lhs.title == rhs.title && lhs.subtitle == lhs.subtitle && lhs.image == rhs.image
    }
}
