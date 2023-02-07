//
//  FeedCellViewModel.swift
//  Instagram
//
//  Created by katka.slivova on 07/02/2023.
//

import SwiftUI

class FeedCellViewModel: ObservableObject {
    @Published var post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    
    func like() {
        print("like post")
    }
    
    
    func unlike() {
        print("unlike post")
    }
    
    
    func checkIfUserLikedPost() {
        
    }
}
