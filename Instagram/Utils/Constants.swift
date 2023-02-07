//
//  Constants.swift
//  Instagram
//
//  Created by katka.slivova on 01/02/2023.
//

import Firebase
import FirebaseCore

let COLLECTION_USERS = Firestore.firestore().collection("users")
let COLLECTION_FOLLOWERS = Firestore.firestore().collection("followers")
let COLLECTION_FOLLOWING = Firestore.firestore().collection("following")
let COLLECTION_POSTS = Firestore.firestore().collection("posts")
