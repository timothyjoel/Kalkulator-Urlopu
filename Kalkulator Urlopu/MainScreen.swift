//  Created by Tymoteusz Stokarski on 03/11/2020.
//

import SwiftUI

struct ContentView: View {
    
    @State var beginDate: Date = Date(timeIntervalSince1970: 0)
    
    
    var body: some View {
        ZStack {
            Color.customBackground.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                HStack() {
                    Text("Zatrudnienie")
                    .font(.system(size: 15, weight: .semibold, design: .rounded))
                    .foregroundColor(.customSectionTitle)
                    .padding(.horizontal)
                    Spacer()
                }
                HStack {
                    Spacer()
                    DatePicker("Początek zatrudnienia", selection: $beginDate, displayedComponents: .date)
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .accentColor(Color.customPink)
                        .environment(\.locale, Locale.init(identifier: "pl"))
                        .foregroundColor(.customLabel)
                        .padding()
                        .background(RoundedCorners(color: .customView, corners: 16))
                    Spacer()
                }
                Spacer()
                

            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(beginDate: Date())
    }
}
