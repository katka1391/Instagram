//
//  UserListView.swift
//  Instagram
//
//  Created by katka.slivova on 30/01/2023.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel: SearchViewModel
    @Binding var searchText: String
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)) { user in
                    NavigationLink(destination: ProfileView(user: user),
                                   label: {
                        UserCell(user: user)
                            .padding(.leading)
                    })
                }
            }
        }
    }
}

