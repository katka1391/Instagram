//
//  FeedViewModel.swift
//  Instagram
//
//  Created by katka.slivova on 03/02/2023.
//

import Foundation
import SwiftUI

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
        init() {
            fetchPosts()
        }
    
    
    func fetchPosts() {
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
}
