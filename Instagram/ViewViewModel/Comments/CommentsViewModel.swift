//
//  CommentsViewModel.swift
//  Instagram
//
//  Created by katka.slivova on 07/02/2023.
//

import SwiftUI
import Firebase

class CommentsViewModel: ObservableObject {
    private let post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    func uploadConmments(commentText: String) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let postId = post.id else { return }
        
        let data: [String: Any] = ["username": user.username,
                                   "profileImageUrl": user.profileImageUrl,
                                   "uid": user.id ?? "",
                                   "timestamp": Timestamp(date: Date()),
                                   "postOwnerUid": post.ownerUid,
                                   "commentText": commentText]
        COLLECTION_POSTS
            .document(postId)
            .collection("post-comments")
            .addDocument(data: data)
    }
    
    func fetchComments() {
        
    }
}
