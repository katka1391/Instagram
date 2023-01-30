//
//  FeedCell.swift
//  Instagram
//
//  Created by katka.slivova on 30/01/2023.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("slivova")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 36)
                    .clipShape(Circle())
                    .cornerRadius(18)
                Text("katka")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
            }.padding(8)
            
            Image("bruno")
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 440)
                .clipped()
            HStack (spacing: 16) {
                Button(action: {
                    
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
            Text("3 likes").font(.system(size: 15, weight: .semibold))
                .padding([.bottom,.leading], 8)
            HStack {
                Text("katka ").font(.system(size: 15, weight: .semibold)) +
                Text("Hiiiii everyone This is my beautiful dog called Bruno who is 6 month old now").font(.system(size: 15))
            }.padding(.horizontal, 8)
            Text("2 days ago ").font(.system(size: 12)).foregroundColor(.gray)
                .padding([.top,.leading], 8)
                .padding(.bottom, 16)
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
