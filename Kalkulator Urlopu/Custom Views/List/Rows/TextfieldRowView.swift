//  Created by Tymoteusz Stokarski.
//  Copyright (c) Tymoteusz Stokarski. All rights reserved.
//

import SwiftUI

struct TextfieldRowView: View {
    
    @Binding var text: String
    var title: String
    var placeholder: String
    var textfieldUnit: String?
    var keyboard: UIKeyboardType
    
    var body: some View {

        HStack {
            Text(title)
                .foregroundColor(.customLabel)
                .font(.text)
            Spacer()
            HStack {
                Spacer()
                VStack (alignment: .trailing) {
                    TextField(placeholder, text: $text)
                        .foregroundColor(.blue)
                        .font(.text)
                        .multilineTextAlignment(.trailing)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 100)
                        .background(Color.customView)
                        .keyboardType(keyboard)
                }
                if textfieldUnit != nil {
                    Text(textfieldUnit!)
                        .foregroundColor(.customLabel)
                        .font(.text)
                }
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
    }
    
    enum TextfieldType {
        case digitsAndText
        case textOnly
        case digitsOnly
    }
    
}

struct TextfieldRowView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            TextfieldRowView(text: .constant("asd"), title: "Enter something", placeholder: "SomeText", textfieldUnit: "PLN", keyboard: .numberPad)
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            TextfieldRowView(text: .constant("asd"), title: "Enter something", placeholder: "SomeText", textfieldUnit: "PLN", keyboard: .numberPad)
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
                .environment(\.colorScheme, .dark)
        }
        
    }
    
}
