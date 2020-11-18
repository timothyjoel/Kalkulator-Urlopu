//  Created by Tymoteusz Stokarski on 12/11/2020.
//

import SwiftUI

struct WebLink: Hashable {
    var title: String
    var url: LinkURL
}

struct LinksRowView: View {
    
    var webLinks: [WebLink]
    
    var body: some View {
        
        HStack (spacing: 0) {
            Spacer()
            .frame(width: 8, height: 5)
            ForEach(webLinks.indices, id: \.self) { index in
                if webLinks.first == webLinks[index] {
                    Text(" ")
                        .font(.text)
                }
                Link(webLinks[index].title,
                     destination: URL(string: webLinks[index].url.rawValue)!)
                    .font(.text)
                    .foregroundColor(.blue)
                if webLinks.last != webLinks[index] {
                    Text(", ")
                        .font(.text)
                }
            }
            Spacer()
        }
        .padding(.vertical, 4)
        .padding(.horizontal, 8)
    }
    
}

struct LegalBasisRowView_Previews: PreviewProvider {
    
   static var previews: some View {
    
        Group {
            LinksRowView(webLinks: [WebLink(title: "Rozdział 8", url: .labourLaw), WebLink(title: "Rozdział 10", url: .labourLaw)])
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")

            LinksRowView(webLinks: [WebLink(title: "Rozdział 8", url: .leaveBenefits)])
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
                .environment(\.colorScheme, .dark)
      }
    
   }
    
}
