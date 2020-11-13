//  Created by Tymoteusz Stokarski on 13/11/2020.
//

import SwiftUI

struct MenuCardView: View {
    
    var card: MenuCard
    
    var body: some View {
        
        NavigationLink( destination: card.link.open(),
            label: {
                        ZStack {
                            HStack {
                                Spacer()
                                Image(card.image.image)
                                    .resizable()
                                    .frame(width: UIScreen.width/2, height: 175, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .scaledToFit()
                                    .offset(x: UIScreen.width/12)
                            }
                            VStack (alignment: .leading, spacing: 8) {
                                HStack {
                                    Text(card.title)
                                        .font(.navigation)
                                        .foregroundColor(.customLabel)
                                        .padding([.top, .horizontal])
                                    Spacer()
                                    Spacer()
                                        .frame(width: UIScreen.width/(5))
                                        .background(Color.red)
                                }
                                HStack {
                                    Text(card.subtitle)
                                        .font(.smallText)
                                        .foregroundColor(.customSectionTitle)
                                        .padding(.horizontal)
                                    Spacer()
                                        .frame(width: UIScreen.width/4)
                                }
                                Spacer()
                
                            }
                
                        }
                        .frame(width: UIScreen.width-32, height: 200, alignment: .center)
                        .background(RoundedCorners(color: .customView, corners: 10))
                        .padding(.vertical, 4)
            })

    }
}
