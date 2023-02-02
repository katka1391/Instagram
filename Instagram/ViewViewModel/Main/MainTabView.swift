//
//  MainTabView.swift
//  Instagram
//
//  Created by katka.slivova on 26/01/2023.
//

import SwiftUI
import Foundation
import UIKit

struct MainTabView: View {
    let user: User
    @Binding var selectedIndex: Int
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedIndex) {
                FeedView()
                    .onTapGesture {
                        selectedIndex = 0
                    }
                    .tabItem {
                    Image(systemName: "house")
                    }.tag(0)
                
                SearchView()
                    .onTapGesture {
                        selectedIndex = 1
                    }
                    .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)
                
                UploadPostView(tabIndex: $selectedIndex)
                    .onTapGesture {
                        selectedIndex = 2
                    }
                    .tabItem {
                    Image(systemName: "plus.square")
                }.tag(2)
                
                NotificationView()
                    .onTapGesture {
                        selectedIndex = 3
                    }
                    .tabItem {
                    Image(systemName: "heart")
                }.tag(3)
                
                ProfileView(user: user)
                    .onTapGesture {
                        selectedIndex = 4
                    }
                    .tabItem {
                    Image(systemName: "person")
                }.tag(4)
            }           
            .navigationTitle(tabTitle)
            .toolbarBackground(Color.clear, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: logOutButton)
            .accentColor(.black)
        }
    }
    
    var logOutButton: some View {
        Menu {
            Button(action: {
                AuthViewModel.shared.signOut()
            }, label: {
                Text("Logout").foregroundColor(.black)
                    .font(.system(size: 16, weight: .semibold)) 
            })
        } label: {
            Image("instagram-title")
                .resizable()
                .scaledToFit()
                .frame(width: 100)        }
  
    }
    
    var tabTitle: String {
        switch selectedIndex {
        case 0: return "Feed"
        case 1: return "Explore"
        case 2: return "New post"
        case 3: return "Notification"
        case 4: return "Profile"
        default: return ""
        }
    }
}
