//
//  RemoteUsersView.swift
//  MinutasApp
//
//  Created by Enrique Zavala Garcia on 06/12/25.
//

import SwiftUI

struct RemoteUsersView: View {
    
    @StateObject private var viewModel = RemoteUsersViewModel()
    
    var body: some View {
        NavigationStack {
            Group {
                switch viewModel.state {
                case .idle, .loading:
                    VStack {
                        Spacer()
                        ProgressView("Cargando usuarios…")
                        Spacer()
                    }
                    
                case .error(let message):
                    VStack(spacing: 12) {
                        Text("No se pudieron cargar los usuarios.")
                            .font(.headline)
                        Text(message)
                            .font(.footnote)
                            .foregroundColor(.secondary)
                        Button("Reintentar") {
                            viewModel.fetchUsers()
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    
                case .success:
                    List(viewModel.users) { user in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.name)
                                .font(.headline)
                            Text("@\(user.username)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Text(user.email)
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Usuarios (API)")
        }
        .onAppear {
            if case .idle = viewModel.state {
                viewModel.fetchUsers()
            }
        }
    }
}

#Preview {
    RemoteUsersView()
}
