//
//  ProfileHeaderView.swift
//  Instagram
//
//  Created by katka.slivova on 30/01/2023.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("slivova")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading, 16)
                Spacer()
                HStack (spacing: 8) {
                    UserStatView(value: 1, title: "Post")
                    UserStatView(value: 7, title: "Followers")
                    UserStatView(value: 4, title: "Following")
                }.padding(.trailing, 16)
            }
            VStack (alignment: .leading, spacing: 4) {
                Text("Katarina Slivova")
                    .font(.system(size: 15, weight: .semibold))
                Text("Ski and climber lover 🌄")
                    .font(.system(size: 15))
            }.padding(.horizontal)
           
            ProfileActionButton()
            
           Spacer()
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
