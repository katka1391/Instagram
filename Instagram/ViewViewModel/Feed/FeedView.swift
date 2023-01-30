//
//  FeedView.swift
//  Instagram
//
//  Created by katka.slivova on 26/01/2023.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0 ..< 10) {_ in
                    FeedCell()
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
