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
    private var textfieldUnit: TextfieldUnit? = nil
    private var maxValue: Int
    
    init(title: String, textfieldUnit: TextfieldUnit? = nil, value: Binding<Int>, maxValue: Int) {
        self.title = title
        self.textfieldUnit = textfieldUnit
        self._value = value
        self.maxValue = maxValue
    }
    
    var body: some View {

        HStack (spacing: 4) {
            Text(title + (textfieldUnit != nil ? " [\(textfieldUnit!.value)]" : ""))
                .foregroundColor(.customLabel)
                .font(.text)
            Spacer()
            TextField(textfieldUnit?.value ?? "", text: $text) { changed in
                let convertedValue = Int(text)?.trimTo(maxValue)
                self.text = convertedValue == nil ? "" : String(convertedValue!)
                self.value = convertedValue ?? 0
            }.onAppear(perform: {
                self.text = value != 0 ? value.asString() : ""
            })
                .foregroundColor(.blue)
                .font(.text)
                .multilineTextAlignment(.trailing)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 100)
                .background(Color.customView)
                .keyboardType(.numberPad)
                .introspectTextField { (textField) in
                    let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: textField.frame.size.width, height: 44))
                    let flexButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
                    let doneButton = UIBarButtonItem(title: "Akceptuj", style: .done, target: self, action: #selector(textField.doneButtonTapped(button:)))
                    doneButton.tintColor = .systemBlue
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

enum TextfieldUnit {
    
    case PLN
    case percentage
    case number
    case day
    
    var value: String {
        switch self {
        case .number: return "n"
        case .percentage: return "%"
        case .PLN: return "zł"
        case .day: return "dni"
        }
    }
}
