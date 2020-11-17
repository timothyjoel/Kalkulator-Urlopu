//  Created by Tymoteusz Stokarski.
//  Copyright (c) Tymoteusz Stokarski. All rights reserved.
//

import SwiftUI
import Combine

struct TextfieldRowView<T>: View {
    
    @Binding var value: T
    var title: String
    var placeholder: String
    var textfieldUnit: String?
    var keyboard: UIKeyboardType = .default
    var maximumCharacters: Int = 5
    
    var body: some View {

        HStack (spacing: 4) {
            Text(title + (textfieldUnit != nil ? " [\(textfieldUnit!)]" : ""))
                .foregroundColor(.customLabel)
                .font(.text)
            Spacer()
            TextField(placeholder, value: $value, formatter: keyboard == .numberPad ? NumberFormatter() : Formatter())
                .foregroundColor(.blue)
                .font(.text)
                .multilineTextAlignment(.trailing)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 100)
                .background(Color.customView)
                .keyboardType(keyboard)
//                .onReceive(Just(self.value)) { inputValue in
//                    self.value = String(describing: inputValue).prefix(maximumCharacters) as! T
//                    self.value = ("\(inputValue)".prefix(maximumCharacters)) as! T
//                }
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
            TextfieldRowView(value: .constant(30), title: "Title1", placeholder: "placeholder", textfieldUnit: "zł", keyboard: .numberPad, maximumCharacters: 4)
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            TextfieldRowView(value: .constant(30), title: "Title1", placeholder: "placeholder", textfieldUnit: "zł", keyboard: .numberPad, maximumCharacters: 4)
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
                .environment(\.colorScheme, .dark)
        }
        
    }
    
}
