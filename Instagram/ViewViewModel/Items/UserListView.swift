//
//  UserListView.swift
//  Instagram
//
//  Created by katka.slivova on 30/01/2023.
//

import SwiftUI

struct UserListView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0 ..< 10) { _ in
                    NavigationLink(destination: ProfileView(),
                                   label: {
                        UserCell().padding(.leading)
                    })
                }
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
