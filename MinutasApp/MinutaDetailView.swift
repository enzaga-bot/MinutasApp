//
//  MinutaDetailView.swift
//  MinutasApp
//
//  Created by Enrique Zavala Garcia on 03/12/25.
//
//

import SwiftUI

struct MinutaDetailView: View {
    
    let minuta: Minuta
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                
// Título
                Text(minuta.titulo)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.bottom, 8)
                
// Fecha
                HStack {
                    Image(systemName: "calendar")
                    Text(minuta.fecha)
                    Spacer()
                }
                .font(.subheadline)
                
                // Hora
                HStack {
                    Image(systemName: "clock")
                    Text(minuta.hora)
                    Spacer()
                }
                .font(.subheadline)
                
                Divider()
                    .padding(.vertical, 8)
                
// Orden del día
                // Orden del día
                SectionTitleView(text: "Orden del día")

                ForEach(minuta.ordenDelDia, id: \.self) { punto in
                    HStack(alignment: .top, spacing: 8) {
                        Text("•")
                        Text(punto)
                            .font(.body)
                    }
                }
                
// Asistentes
                SectionTitleView(text: "Asistentes")

                ForEach(minuta.asistentes, id: \.self) { asistente in
                    Text("• \(asistente)")
                        .font(.body)
                }
                
// Acuerdos (solo si existen)
                if let acuerdos = minuta.acuerdos, !acuerdos.isEmpty {
                    SectionTitleView(text: "Acuerdos")
                    
                    ForEach(acuerdos, id: \.self) { acuerdo in
                        Text("• \(acuerdo)")
                            .font(.body)
                    }
                }
                
                
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Detalle")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MinutaDetailView(
        minuta: Minuta(
            titulo: "Reunión de ejemplo",
            fecha: "Viernes 5 de Diciembre de 2025",
            hora: "10:30am - 11:30am",
            ordenDelDia: [
                "Punto 1",
                "Punto 2"
            ],
            asistentes: [
                "Persona 1",
                "Persona 2"
            ],
            acuerdos: [
                "Acuerdo 1",
                "Acuerdo 2"
            ]
        )
    )
}


