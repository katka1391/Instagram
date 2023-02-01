//
//  ProfileView.swift
//  Instagram
//
//  Created by katka.slivova on 26/01/2023.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView(user: user).padding(.bottom, 16)
                PostGridView()
            }
        }
    }
}
