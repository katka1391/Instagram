//
//  NotificationCell.swift
//  Instagram
//
//  Created by katka.slivova on 30/01/2023.
//

import SwiftUI

struct NotificationCell: View {
    @State private var showPostImage = false
    var body: some View {
        HStack {
            Image("slivova")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            Text("katka ")
                .font(.system(size: 15, weight: .semibold)) + Text("liked your post").font(.system(size: 15))
            Spacer()
            
            if showPostImage {
                Image("slivova")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Rectangle())
            } else {
                Button(action: {
                    print("//TODO LATER")
                }, label: {
                    Text("Following")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .font(.system(size: 14, weight: .semibold))
                })
            }
        }.padding(.horizontal)
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}
