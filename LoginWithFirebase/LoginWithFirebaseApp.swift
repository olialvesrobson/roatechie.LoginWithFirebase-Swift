//
//  LoginWithFirebaseApp.swift
//  LoginWithFirebase
//
//  Created by Robson Oliveira Alves on 5/11/20.
//

import SwiftUI
import Firebase
import UIKit // We will need UIKit to implement AppDelegate

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Configure FirebaseApp
        FirebaseApp.configure()
        return true
    }
}

@main
struct LoginWithFirebaseApp: App {
    
    // Create a reference to the App Delegate
         @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
            
        }
    }
}
