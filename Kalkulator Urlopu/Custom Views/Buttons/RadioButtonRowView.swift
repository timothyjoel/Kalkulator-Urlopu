//  Created by Tymoteusz Stokarski.
//

import SwiftUI

protocol StringDescriptive {
    var description: String { get }
}

struct GroupedRadioButtonsView<T: CustomStringConvertible & Equatable>: View {
    
    let items: [T]
    @Binding var selectedItem: T
    
    var body: some View {
        
        VStack {
            ForEach(items.indices, id: \.self) { index in
                Button(action: {
                    self.selectedItem = items[index]
                }) {
                    HStack(alignment: .center, spacing: 10) {
                        Text(items[index].description)
                            .font(.text)
                            .foregroundColor(.customLabel)
                        Spacer()
                        Image(systemName: self.selectedItem == items[index] ? Icon.circleFilled.name : Icon.circleEmpty.name)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .foregroundColor(.blue)
                    }
                }
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
    }
}

struct RadioButtonRowView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            GroupedRadioButtonsView(items: SickLeaveReason.allCases, selectedItem: .constant(.regularSickness))
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            GroupedRadioButtonsView(items: SickLeaveReason.allCases, selectedItem: .constant(.regularSickness))
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
                .environment(\.colorScheme, .dark)
                
        }
        
    }
    
}
