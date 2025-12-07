//
//  MainTabView.swift
//  MinutasApp
//
//  Created by Enrique Zavala Garcia on 06/12/25.
//

import SwiftUI

struct MainTabView: View {
    
    let onLogout: () -> Void
    
    var body: some View {
        TabView {
            // Tab 1: Minutas
            MinutasView(onLogout: onLogout)
                .tabItem {
                    Label("Minutas", systemImage: "doc.text")
                }
            
            // Tab 2: Resumen
            ResumenView()
                .tabItem {
                    Label("Resumen", systemImage: "chart.bar")
                }
            
            RemoteUsersView()
                           .tabItem {
                               Label("Usuarios", systemImage: "person.3")
                           }
        }
    }
}

#Preview {
    MainTabView(onLogout: {})
}
