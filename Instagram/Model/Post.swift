//
//  Post.swift
//  Instagram
//
//  Created by katka.slivova on 03/02/2023.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    let ownerUid: String
    let ownerUsername: String
    let caption: String
    let likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    let ownerImageUrl: String
    
    var didLike: Bool? = false
}
