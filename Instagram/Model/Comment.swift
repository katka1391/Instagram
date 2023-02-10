//
//  Comment.swift
//  Instagram
//
//  Created by katka.slivova on 07/02/2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Comment: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let postOwnerUid: String
    let profileImageUrl: String
    let commentText: String
    let timestamp: Timestamp
    let uid: String
}
