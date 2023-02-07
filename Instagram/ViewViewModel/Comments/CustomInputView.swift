//
//  CustomInputView.swift
//  Instagram
//
//  Created by katka.slivova on 07/02/2023.
//

import SwiftUI

struct CustomInputView: View {
    @Binding var inputText: String
    
    //thi is how we represent action which doesnt return anything
    var action: () -> Void
    
    var body: some View {
        VStack {
            Divider()
            HStack {
                TextField("Commens ...", text: $inputText)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(minHeight: 30)
                
                Button(action: action) {
                    Text("Send")
                        .bold()
                        .foregroundColor(.black)
                }
            }.padding(.horizontal)
                .padding(.bottom)
        }
    }
}
