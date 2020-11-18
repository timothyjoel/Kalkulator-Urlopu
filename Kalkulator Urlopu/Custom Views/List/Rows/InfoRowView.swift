//  Created by Tymoteusz Stokarski on 12/11/2020.
//

import SwiftUI

struct WebLink: Hashable {
    var title: String
    var url: String
}

struct LegalBasisRowView: View {
    
    var law: String? = ""
    var webLinks: [WebLink]
    
    var body: some View {
        
        HStack (spacing: 0) {
            Text(law ?? "")
                .font(.text)
                .foregroundColor(.customLabel)
                .padding(.leading, 8)
                .multilineTextAlignment(.leading)
            ForEach(webLinks.indices, id: \.self) { index in
                if webLinks.first == webLinks[index] && law != nil {
                    Text(" ")
                        .font(.text)
                }
                Link(webLinks[index].title,
                     destination: URL(string: webLinks[index].url)!)
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
            LegalBasisRowView(law: "Ustawa zasiłkowa", webLinks: [WebLink(title: "Rozdział 8", url: "asd"), WebLink(title: "Rozdział 10", url: "asd")])
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")

            LegalBasisRowView(law: "Ustawa zasiłkowa", webLinks: [WebLink(title: "Rozdział 8", url: "asd")])
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
                .environment(\.colorScheme, .dark)
      }
    
   }
    
}
