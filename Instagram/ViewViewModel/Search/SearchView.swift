//
//  SearchView.swift
//  Instagram
//
//  Created by katka.slivova on 26/01/2023.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @State var inSearchMode = false
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText, isEditing: $inSearchMode).padding()
            
            ZStack {
                if inSearchMode {
                    UserListView()
                } else {
                    PostGridView()
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
