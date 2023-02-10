//
//  Notification.swift
//  Instagram
//
//  Created by katka.slivova on 09/02/2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


struct Notification: Identifiable, Decodable {
    @DocumentID var id: String?
    var postId: String?
    let username: String
    let profileImageUrl: String
    let timestamp: Timestamp
    let type: Int
    let uid: String
}

enum NotificationType: Int, Decodable {
    case like
    case comment
    case follow
        
    var notificationMessage: String {
        switch self {
            case .like: return " liked one of your posts."
            case .comment: return " commented one of your posts."
            case .follow: return " started following you."
        }
    }
}
