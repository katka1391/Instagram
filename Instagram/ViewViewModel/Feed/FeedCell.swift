//
//  FeedCell.swift
//  Instagram
//
//  Created by katka.slivova on 30/01/2023.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    @ObservedObject var viewModel: FeedCellViewModel
    
    var didLike: Bool { return viewModel.post.didLike ?? false }
    
    init(viewModel: FeedCellViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {        
        VStack(alignment: .leading) {
            HStack {
                KFImage(URL(string: viewModel.post.ownerImageUrl))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 36)
                    .clipShape(Circle())
                    .cornerRadius(18)

                Button(action: {
                    
                }, label: {
                    Text(viewModel.post.ownerUsername)
                        .font(.system(size: 14, weight: .semibold))
                })
                Spacer()
            }.padding(8)
            
            KFImage(URL(string: viewModel.post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 440)
                .clipped()
            
            HStack (spacing: 16) {
                Button(action: {
                    didLike ? viewModel.unlike() : viewModel.like()
                }, label: {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .font(.system(size: 20))
                })
                Button(action: {
                    
                }, label: {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .font(.system(size: 20))
                })
                Button(action: {
                    
                }, label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .font(.system(size: 20))
                })
            }.padding(8)
                .foregroundColor(.black)
            Text("\(viewModel.post.likes) likes").font(.system(size: 15, weight: .semibold))
                .padding([.bottom,.leading], 8)
            HStack {
                Text(viewModel.post.ownerUsername).font(.system(size: 15, weight: .semibold)) +
                Text(" \(viewModel.post.caption)").font(.system(size: 15))
            }.padding(.horizontal, 8)
            Text("2 days ago ").font(.system(size: 12)).foregroundColor(.gray)
                .padding([.top,.leading], 8)
                .padding(.bottom, 16)
        }
    }
}
