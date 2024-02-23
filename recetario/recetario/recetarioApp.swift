//
//  recetarioApp.swift
//  recetario
//
//  Created by user246311 on 10/4/23.
//

import SwiftUI
import FirebaseCore



@main
struct recetarioApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
                ContentView()
                          }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
