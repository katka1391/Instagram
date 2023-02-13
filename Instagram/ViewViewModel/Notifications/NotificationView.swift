//
//  NotificationView.swift
//  Instagram
//
//  Created by katka.slivova on 26/01/2023.
//

import SwiftUI

struct NotificationView: View {
    @ObservedObject var viewModel = NotificationsViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack (spacing: 16) {
                ForEach (viewModel.notifications) { notification in
                    NotificationCell(notification: notification)
                        .padding(.top)
                }
            }
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
