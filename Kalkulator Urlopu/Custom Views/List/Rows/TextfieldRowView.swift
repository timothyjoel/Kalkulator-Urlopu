//  Created by Tymoteusz Stokarski.
//  Copyright (c) Tymoteusz Stokarski. All rights reserved.
//

import SwiftUI

struct TextfieldRowView: View {
    
    @Binding var text: String
    var title: String
    var textfieldType: String?
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
                    TextField("", text: $text)
                        .foregroundColor(.blue)
                        .font(.text)
                        .multilineTextAlignment(.trailing)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .frame(width: 100)
                        .keyboardType(.asciiCapable)
                Spacer()
                    .frame(width: 70, height: 1)
                    .background(Color.blue)
                }

                if textfieldType != nil {
                    Text(textfieldType ?? "")
                        .foregroundColor(.customLabel)
                        .font(.text)
                }
            }

            
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        
        
    }
    
}

struct TextfieldRowView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            TextfieldRowView(text: .constant("asd"), title: "Enter something", textfieldType: "PLN", keyboard: .numberPad)
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            TextfieldRowView(text: .constant("asd"), title: "Enterr something", keyboard: .numberPad)
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
                .environment(\.colorScheme, .dark)
        }
        
    }
    
}
