//
//  MinutaDetailView.swift
//  MinutasApp
//
//  Created by Enrique Zavala Garcia on 03/12/25.
//

import SwiftUI


struct MinutaDetailView: View {
    
    //Recibe minuta completa
    let minuta: Minuta
    

    var body: some View {
        
        VStack (alignment: .leading, spacing: 16) {
            //Título de la minuta
            Text(minuta.titulo)
                .font(.title2)
                .fontWeight(.semibold)
            
            // Fecha y Hora (Maquetados)
            Text("Fecha: \(minuta.fecha)").font(.subheadline)
            
            Text("Hora: \(minuta.hora)")
                .font(.subheadline)
            
            Divider()
            
// Órden del día
            Text("Órden del Día")
                .font(.headline)
            
            ForEach(minuta.ordenDelDia, id: \.self) { punto in
                HStack (alignment: .top, spacing: 8) {
                    Text("•")
                    Text(punto)
                        .font(.body)
                } //HStack
            } // ForEach
            
            
//Asistentes
            Text("Asistentes")
                .font(.headline)
                .padding(.top, 16)
            
            ForEach (minuta.asistentes, id: \.self) { asistente in
                Text("• \(asistente)")
                    .font(.body)
            }//ForEach
            
            Spacer()
            
        }//VStack
        .padding()
        
    } // body
} // struct

#Preview {
    let ejemplo = Minuta(
        titulo: "titulo ejemplo minuta",
        fecha: "fecha ejemplo minuta",
        hora: "hora ejemplo minuta",
        ordenDelDia: [
        "Orden del Día Ejemplo 01",
        "Orden del Día Ejemplo 02",
        "Orden del Día Ejemplo 03",
        "Orden del Día Ejemplo 04"
        ],
        asistentes: [
        "Asistente Ejemplo 01",
        "Asistente Ejemplo 02",
        "Asistente Ejemplo 03",
        "Asistente Ejemplo 04"
        ]
    )//Minuta
    MinutaDetailView(minuta: ejemplo)
}
