//
//  TextArea.swift
//  Instagram
//
//  Created by katka.slivova on 02/02/2023.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeholder: String

    init(text: Binding<String>, placeholder: String) {
        UITextView.appearance().backgroundColor = .clear
        self._text = text
        self.placeholder = placeholder
        
    }

    var body: some View {
        ZStack(alignment: .topLeading){
            TextEditor(text: $text)
                .padding(4)
            
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(UIColor.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }

          
        }
        .font(.body)
    }
}
