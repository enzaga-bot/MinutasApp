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
                
                Text("Esta Aplicación iOS ha sido desarrollada en Swift para gestionar minutas y órdenes del día.  Se ha desarrollado como proyecto final de la materia MTW y está pensada como una app sencilla pero estructurada con buenas prácticas (MVVM, vistas reutilizables, consumo de API, etc.).")
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



