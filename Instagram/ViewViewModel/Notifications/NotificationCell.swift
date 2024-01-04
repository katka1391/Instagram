//
//  NotificationCell.swift
//  Instagram
//
//  Created by katka.slivova on 30/01/2023.
//

import SwiftUI
//import Kingfisher

struct NotificationCell: View {
    @State private var showPostImage = false
    @ObservedObject var viewModel: NotificationCellViewModel
    
    //computed property =  is a property that calculates and returns a value, rather than just store it
    var isFollowed: Bool { return viewModel.notification.isFollowed ?? false }
    
    init(notification: Notification) {
        self.viewModel = NotificationCellViewModel(notification: notification)
    }
    
    var body: some View {
        HStack {
            if let user = viewModel.notification.user {
                NavigationLink(destination: {
                    ProfileView(user: user)
                }, label: {
//                    KFImage(URL(string: viewModel.notification.profileImageUrl))
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 48, height: 48)
//                        .clipShape(Circle())
                    Text(viewModel.notification.username)
                        .font(.system(size: 15, weight: .semibold)) + Text(viewModel.notification.type.notificationMessage).font(.system(size: 15))
                })
            }
            Spacer()
            
            if viewModel.notification.type != .follow {
                if let post = viewModel.notification.post {
//                    KFImage(URL(string: post.imageUrl))
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 48, height: 48)
//                        .clipShape(Rectangle())
                }
            } else {
                Button(action: {
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                }, label: {
                    Text(isFollowed ? "Following" : "Follow").font(.system(size: 15, weight: .semibold))
                        .frame(width: 100, height: 32)
                        .foregroundColor(isFollowed ? .black : .white)
                        .background(isFollowed ? Color.white : Color.blue)
                        .cornerRadius(3)
                        .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray, lineWidth: isFollowed ? 1 : 0)
                        )
                })
            }
        }.padding(.horizontal)
    }
}
