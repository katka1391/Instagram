//
//  PostGridViewModel.swift
//  Instagram
//
//  Created by katka.slivova on 06/02/2023.
//

import SwiftUI

enum PostGridConfiguration {
    case search
    case profile(String)
}

class PostGridViewModel: ObservableObject {
    @Published var posts = [Post]()
    let config: PostGridConfiguration
    
    init(config: PostGridConfiguration) {
        self.config = config
        fetchPosts(forConfig: config)
    }
    
    func fetchPosts(forConfig config: PostGridConfiguration) {
        switch config {
        case .search:
            fetchSearchPosts()
        case .profile(let uid):
            fetchProfilePosts(forUid: uid)
        }
    }
  
    func fetchSearchPosts() {
        COLLECTION_POSTS.getDocuments { (snapshot, error) in
            if let error = error {
                print("DEBUG: Error fetching posts \(error.localizedDescription)")
            } else {
                guard let documents = snapshot?.documents else { return }
                self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
                
                print("fetchinch post: \(self.posts)")
            }
        }
    }
    
    func fetchProfilePosts(forUid uid: String) {
        COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
        }
    }
}
