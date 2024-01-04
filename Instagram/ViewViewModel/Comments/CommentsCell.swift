//
//  CommentsCell.swift
//  Instagram
//
//  Created by katka.slivova on 07/02/2023.
//

import SwiftUI
//import Kingfisher

struct CommentsCell: View {
    let comment: Comment
    
    var body: some View {
        HStack {
//            KFImage(URL(string: comment.profileImageUrl))
//                .resizable()
//                .scaledToFit()
//                .clipShape(Circle())
//                .frame(width: 36, height: 36)
               
            Text(comment.username).font(.system(size: 14, weight: .semibold)) +
            Text(" \(comment.commentText)").font(.system(size: 14))
            Spacer()
            Text("2 m")
                .foregroundColor(.gray)
                .font(.system(size: 12))
        }.padding(.horizontal)
    }
}
