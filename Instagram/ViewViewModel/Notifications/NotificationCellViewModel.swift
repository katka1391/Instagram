//
//  NotificationCellViewModel.swift
//  Instagram
//
//  Created by katka.slivova on 10/02/2023.
//

import Foundation
import SwiftUI

class NotificationCellViewModel: ObservableObject {
    @Published var notification: Notification
    
    init(notification: Notification) {
        self.notification = notification
        checkIfUserIsFollowed()
        fetchNotificationPost()
        fetchNotificationUser()
    }
    
    func follow() {
        UserService.follow(uid: notification.uid) { _ in
            NotificationsViewModel.uploadNotification(toUid: self.notification.uid, type: .follow)
            self.notification.isFollowed = true
        }
    }
    
    func unfollow() {
        UserService.unfollow(uid: notification.uid) { _ in
            self.notification.isFollowed = false
        }
    }
    
    func checkIfUserIsFollowed() {
        guard notification.type == .follow else { return }
        UserService.checkIfUserIsFollowed(uid: notification.uid) { isFolowed in
            self.notification.isFollowed = isFolowed
        }
    }
    
    func fetchNotificationPost() {
        guard let postId = notification.postId else { return }
        
        COLLECTION_POSTS.document(postId)
            .getDocument { snapshot, _ in
                self.notification.post = try? snapshot?.data(as: Post.self)
            }
    }
    
    func fetchNotificationUser() {
        COLLECTION_USERS
            .document(notification.uid)
            .getDocument {  snapshot, _ in
                self.notification.user = try? snapshot?.data(as: User.self)
                print("fetchNotificationUser \(String(describing: self.notification.user?.username))")
            }
    }
}
