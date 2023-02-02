//
//  ProfileActionButton.swift
//  Instagram
//
//  Created by katka.slivova on 30/01/2023.
//

import SwiftUI

struct ProfileActionButton: View {
    @ObservedObject var viewModel: ProfileViewModel

    var isFollowed: Bool { return viewModel.user.isFollowed ?? false}
    
    var body: some View {
        if viewModel.user.isCurrentUser {
            HStack{
                Spacer()
                Button(action: {
                    print("// TODO LATER")
                }, label: {
                    Text("Edit Profile").font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.black)
                        .frame(width: 360, height: 32)
                        .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray, lineWidth: 1)
                        )
                })
                Spacer()
            }.padding(.top, 16)
        } else {
            HStack {
                Spacer ()
                Button(action: {
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                }, label: {
                    Text(isFollowed ? "Following" : "Follow").font(.system(size: 15, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(isFollowed ? .black : .white)
                        .background(isFollowed ? Color.white : Color.blue)
                        .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray, lineWidth: isFollowed ? 1 : 0)
                        )
                }).cornerRadius(3)
                .padding(.trailing, 8)
                    
                Button(action: {
                    print("// TODO LATER")
                }, label: {
                    Text("Message").font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.black)
                        .frame(width: 172, height: 32)
                        .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray, lineWidth: 1)
                        )
                })
                Spacer ()
            }
        }
    }
}
