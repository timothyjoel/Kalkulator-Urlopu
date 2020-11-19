//  Created by Tymoteusz Stokarski.
//  Copyright (c) Tymoteusz Stokarski. All rights reserved.
//

import SwiftUI
import Combine
import Introspect

struct NumericTextfieldRow: View {
    
    @Binding var value: Int
    @State var text: String = ""
    private var title: String
    private var textfieldUnit: String? = nil
    private var keyboard: UIKeyboardType = .default
    private var maxValue: Int
    
    init(title: String, textfieldUnit: String? = nil, value: Binding<Int>, keyboard: UIKeyboardType = .default, maxValue: Int) {
        self.title = title
        self.textfieldUnit = textfieldUnit
        self._value = value
        self.keyboard = keyboard
        self.maxValue = maxValue
    }
    
    var body: some View {

        HStack (spacing: 4) {
            Text(title + (textfieldUnit != nil ? " [\(textfieldUnit!)]" : ""))
                .foregroundColor(.customLabel)
                .font(.text)
            Spacer()
            TextField(textfieldUnit ?? "", text: $text) { changed in
                let convertedValue = Int(text)?.trimTo(maxValue)
                self.text = convertedValue == nil ? "" : String(convertedValue!)
                self.value = convertedValue ?? 0
                print(value)
            }.onAppear(perform: {
                self.text = value != 0 ? value.asString() : ""
            })
                .foregroundColor(.blue)
                .font(.text)
                .multilineTextAlignment(.trailing)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 100)
                .background(Color.customView)
                .keyboardType(keyboard)
                .introspectTextField { (textField) in
                    let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: textField.frame.size.width, height: 44))
                    let flexButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
                    let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(textField.doneButtonTapped(button:)))
                    doneButton.tintColor = .systemPink
                    toolBar.items = [flexButton, doneButton]
                    toolBar.setItems([flexButton, doneButton], animated: true)
                    textField.inputAccessoryView = toolBar
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

//struct TextfieldRowView_Previews: PreviewProvider {
//
//    static var previews: some View {
//
//        Group {
//            TextfieldRowView(value: .constant(30), title: "Title1", placeholder: "Dni", textfieldUnit: "Unit", keyboard: .numberPad, maximumCharacters: 4)
//                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
//                .previewDisplayName("iPhone 8")
//            TextfieldRowView(value: .constant(30), title: "Title1", placeholder: "Dni", textfieldUnit: "Unit", keyboard: .numberPad, maximumCharacters: 4)
//                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
//                .previewDisplayName("iPhone XS Max")
//                .environment(\.colorScheme, .dark)
//        }
//
//    }
//
//}
