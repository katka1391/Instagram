//
//  InstagramApp.swift
//  Instagram
//
//  Created by katka.slivova on 26/01/2023.
//

import SwiftUI
//import Firebase

import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}


@main
struct InstagramApp: App {
    
//    init() {
//        FirebaseApp.configure()
//    }
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    
    var body: some Scene {
        WindowGroup {
           // MainTabView()
            LoginView()
        }
    }
}
