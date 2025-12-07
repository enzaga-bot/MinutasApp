//
//  MinutasViewModel.swift
//  MinutasApp
//
//  Created by Enrique Zavala Garcia on 06/12/25.
//

import Foundation
import SwiftUI

final class MinutasViewModel: ObservableObject {
    
    enum LoadState {
        case idle
        case loading
        case success
        case error(String)
    }
    
    @Published var minutas: [Minuta] = []
    @Published var state: LoadState = .idle
    
    func cargarMinutasDesdeJSON() {
        // si ya están cargadas, no vuelvas a leer el archivo
        guard minutas.isEmpty else { return }
        
        state = .loading
        
        guard let url = Bundle.main.url(forResource: "minutas", withExtension: "json") else {
            state = .error("No se encontró minutas.json en el bundle")
            print("No se encontró minutas.json en el bundle")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode([Minuta].self, from: data)
            minutas = decoded
            state = .success
        } catch {
            state = .error("Error al decodificar minutas.json")
            print("Error al decodificar minutas.json: \(error)")
        }
    }
    
    func agregar(minuta: Minuta) {
        minutas.append(minuta)
    }
}
