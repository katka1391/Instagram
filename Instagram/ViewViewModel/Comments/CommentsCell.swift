//
//  CommentsCell.swift
//  Instagram
//
//  Created by katka.slivova on 07/02/2023.
//

import SwiftUI

struct CommentsCell: View {
    var body: some View {
        HStack {
            Image("katka")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 36, height: 36)
               
            Text("katka").font(.system(size: 14, weight: .semibold)) +
            Text(" Some text go here.").font(.system(size: 14))
            Spacer()
            Text("2 m")
                .foregroundColor(.gray)
                .font(.system(size: 12))
        }.padding(.horizontal)
    }
}

struct CommentsCell_Previews: PreviewProvider {
    static var previews: some View {
        CommentsCell()
    }
}
