//
//  ContentView.swift
//  MinutasApp
//
//  Created by MTW_000 on 29/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    LoginView(onLogin: {})
}
