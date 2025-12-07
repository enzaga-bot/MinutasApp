//
//  RemoteUsersViewModel.swift
//  MinutasApp
//
//  Created by Enrique Zavala Garcia on 06/12/25.
//

import Foundation

final class RemoteUsersViewModel: ObservableObject {
    
    enum LoadState {
        case idle
        case loading
        case success
        case error(String)
    }
    
    @Published var users: [RemoteUser] = []
    @Published var state: LoadState = .idle
    
    func fetchUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            state = .error("URL inválida")
            return
        }
        
        state = .loading
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    self?.state = .error("Error de red: \(error.localizedDescription)")
                    return
                }
                
                guard let data = data else {
                    self?.state = .error("Respuesta vacía")
                    return
                }
                
                do {
                    let decoded = try JSONDecoder().decode([RemoteUser].self, from: data)
                    self?.users = decoded
                    self?.state = .success
                } catch {
                    self?.state = .error("Error al decodificar JSON")
                }
            }
        }
        
        task.resume()
    }
}
