//
//  FeedView.swift
//  Instagram
//
//  Created by katka.slivova on 26/01/2023.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var viewModel = FeedViewModel()
  
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.posts) { post in
                    FeedCell(viewModel: FeedCellViewModel(post: post))
                }
            }
//            .onAppear {
//                viewModel.fetchPosts()
//            }
        }
    }
}

