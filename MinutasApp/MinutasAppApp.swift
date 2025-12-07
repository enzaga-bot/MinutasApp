//
//  MinutasAppApp.swift
//  MinutasApp
//

import SwiftUI

@main
struct MinutasAppApp: App {
    
    @State private var isLoggedIn = false
    
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                MainTabView(onLogout: {
                 isLoggedIn = false
                })
            } else {
                LoginView(onLogin: {
                    isLoggedIn = true
                })
            }
        }
    }
}
