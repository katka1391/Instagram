//
//  UserService.swift
//  Instagram
//
//  Created by katka.slivova on 02/02/2023.
//

import Firebase
import FirebaseCore

typealias FirestoreCompletion = ((Error?) -> Void)?

struct UserService {
    
    static func follow(uid: String, completion: ((Error?) -> Void)?) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else {
            return
        }
        //here we update current users following list
        COLLECTION_FOLLOWING
            .document(currentUid)
            .collection("user-following")
            .document(uid).setData([:]) { _ in
                //here we update followers list
                COLLECTION_FOLLOWERS
                    .document(uid)
                    .collection("user-followers")
                    .document(currentUid)
                    .setData([:], completion: completion)
            }
    }
    
    static func unfollow(uid: String, completion: ((Error?) -> Void)?) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else {
            return
        }
        //here we delete current user's following list
        COLLECTION_FOLLOWING
            .document(currentUid)
            .collection("user-following")
            .document(uid).delete { _ in
                //here we delete followers list
                COLLECTION_FOLLOWERS
                    .document(uid)
                    .collection("user-followers")
                    .document(currentUid)
                    .delete(completion: completion)
            }
    }
    
    static func checkIfUserIsFollowed(uid: String, completion: @escaping(Bool) -> Void) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else {
            return
        }
        
        COLLECTION_FOLLOWING
            .document(currentUid)
            .collection("user-following")
            .document(uid).getDocument { snapshot, _ in
                guard let isFollowed = snapshot?.exists else { return }
                completion(isFollowed)
            }
    }
}
