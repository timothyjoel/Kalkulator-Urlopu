//  Created by Tymoteusz Stokarski on 13/11/2020.
//

import SwiftUI

struct InfoView<Content>: View where Content: View {
    
    var title: String
    @Binding var show: Bool
    var content: () -> Content
    
    init(title: String = "Informacja", show: Binding<Bool>, @ViewBuilder _ content: @escaping () -> Content) {
        self.title = title
        self.content = content
        self._show = show
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Spacer()
                RoundIconView(icon: .questionMark)
                Spacer()
            }
            .offset(x: 0, y: -28)
            content()
            HStack {
                Spacer()
                Button(action: {
                    self.show.toggle()
                }, label: {
                    Text("Zamknij")
                        .font(.boldedText)
                        .foregroundColor(.blue)
                })
                .padding(.vertical, 16)
                Spacer()
            }

        }
        .frame(width: UIScreen.width-32)
        .background(RoundedCorners(color: .customView, corners: 20).shadow(radius: 30))
        
    }
}

struct InfoMessageRow: View {
    
    var message: String
    
    var body: some View {
        
        Text(message)
            .foregroundColor(.customLabel)
            .font(.text)
            .padding(.horizontal)
        
    }
    
}

struct InfoBulletPointsRow: View {
    
    var bulletPoints: [String]
    
    var body: some View {
        
        VStack (alignment: .leading) {
            ForEach(bulletPoints, id: \.self) { text in
                Text("•  " + text)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .foregroundColor(.customLabel)
                    .font(.text)
                    .padding(.trailing)
                    .padding(.leading, 24)
            }
        }
        .padding(.top)
        
    }
    
}

