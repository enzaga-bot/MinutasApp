//
//  ResumenView.swift
//  MinutasApp
//
//  Created by Enrique Zavala Garcia on 06/12/25.
//

import SwiftUI

struct ResumenView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Resumen")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("Esta pantalla se usará para mostrar información general de minutas, estadísticas o cualquier resumen que quieras para el proyecto final.")
                    .font(.body)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Resumen")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ResumenView()
}
