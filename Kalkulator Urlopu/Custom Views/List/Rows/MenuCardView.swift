//  Created by Tymoteusz Stokarski on 13/11/2020.
//

import SwiftUI

struct MenuCardView: View {
    
    var card: MenuCard
    
    var body: some View {
        
        ZStack {
            // This is a trick to make link arrow disapper in list
            NavigationLink(
                destination: card.route.open()) {
                EmptyView()
            }
            .opacity(0.0)
            .buttonStyle(PlainButtonStyle())
            
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
                .frame(height: 200, alignment: .center)
                .padding(.vertical, 4)
            }
            .background(RoundedCorners(colors: card.background, corners: 10))
            .padding(.bottom, 16)
        }
        .background(Color.customBackground)
        .buttonStyle(PlainButtonStyle())
        .listRowInsets(EdgeInsets())
        
    }
}

struct MenuCardView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            MenuCardView(card: MenuCard(title: "Sampletitle", subtitle: "asdasd asdasd asd asd asdasd asdasd asd asd asdasasdasd asdasd asd asd asd asdasd.", image: .maternityLeave, background: [.red, .orange], route: .maternityLeaveCalculator))
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            
            MenuCardView(card: MenuCard(title: "S", subtitle: "asdasd asdasd asd asd asdasd asdasd asd asd asdasasdasd asdasd asd asd asd asdasd.", image: .maternityLeave, background: [.red, .orange], route: .maternityLeaveCalculator))
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
                .environment(\.colorScheme, .dark)
        }
        
    }
    
}
