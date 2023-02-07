//
//  SearchViewModel.swift
//  Instagram
//
//  Created by katka.slivova on 01/02/2023.
//

import Foundation
import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
//@Published var posts = [Post]()
    
    init() {
        fetchUsers()
     //   fetchPosts()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments() { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            self.users = documents.compactMap {
                try? $0.data(as: User.self)
            }
        }
    }
    
//    func fetchPosts() {
//        COLLECTION_POSTS.getDocuments { (snapshot, error) in
//            if let error = error {
//                print("DEBUG: Error fetching posts \(error.localizedDescription)")
//            } else {
//                guard let documents = snapshot?.documents else { return }
//                self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
//                
//                print("fetchinch post: \(self.posts)")
//            }
//        }
//    }
    
    func filteredUsers(_ query: String) -> [User] {
        let lowercasedQuery = query.lowercased()
        return users.filter {
            $0.fullname.lowercased().contains(lowercasedQuery) || $0.username.contains(lowercasedQuery)
        }
    }
}
