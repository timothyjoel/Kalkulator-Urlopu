//
//  InfoView.swift
//  Kalkulator Urlopu
//
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
                Text(title)
                    .shadow(color: .customView, radius: 10)
                .foregroundColor(.customPink)
                .font(.header)
                .padding(.horizontal)
                .padding(.vertical)
                Spacer()
            }
            content()
            HStack {
                Spacer()
                Button(action: {
                    self.show.toggle()
                }, label: {
                    Text("Close")
                        .font(.text)
                        .foregroundColor(.blue)
                })
                .padding(.vertical, 16)
                Spacer()
            }

        }
        .frame(width: UIScreen.width-32)
        .background(RoundedCorners(color: .customView, corners: 10).shadow(radius: 30))
        
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
                Text("• " + text)
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

