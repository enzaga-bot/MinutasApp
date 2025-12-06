//
//  MinutasView.swift
//  MinutasApp
//
//  Created by Enrique Zavala Garcia on 29/11/25.
//

import SwiftUI

struct MinutasView: View {
    
    //Función de cierre de sesión
    let onLogout: () -> Void
    
    //Minutas desde JSON
    @State private var minutas: [Minuta] = []
    
    
    var body: some View {
        
        NavigationView {
            VStack (alignment: .leading, spacing: 16) {
                
                HStack{
                    Text("Minutas y Órdenes del día")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button(action: onLogout) {
                        Text("Cerrar Sesión")
                    }//Boton
                    .font(.footnote)
                }//HStack
                    .padding(.top, 16)
                
                //Botón Nueva Minuta
                Button(action: agregarMinutaDemo) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Nueva Minuta")
                    }//HStack
                }//Botón
                .padding(.bottom, 8)
                
                // Carga de Minutas
                List(minutas, id: \.titulo) { minuta in
                    NavigationLink(
                        destination: MinutaDetailView(minuta: minuta)   ) {
                            Text(minuta.titulo)
                    }// NavigationLink
                } // List
            } //VStack
            .padding(.horizontal, 16)
            .onAppear{
                cargarMinutasDesdeJSON()
            }//.onAppear
        } // NavigationView
        
    } //body
    
    private func cargarMinutasDesdeJSON() {
        guard let url = Bundle.main.url(forResource: "minutas", withExtension: "json") else {
            print("No se encontró minutas.json en el bundle")
            return
        } //else guard url
        
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode([Minuta].self, from: data)
            minutas = decoded
        } catch {
            print("Error al decodificar minutas.json")
        } // catch
    }// cargarMinutasDesdeJSON
    
    private func agregarMinutaDemo() {
        let nueva = Minuta(
            titulo: "Nueva Minuta desde botón",
            fecha: "4 de Diciembre de 2025",
            hora: "10:30am - 11:00am",
            ordenDelDia: [
                "Punto Ejemplo 1",
                "Punto Ejemplo 2",
                "Punto Ejemplo 3"
            ],
            asistentes: [
                "Daniel Hernández",
                "Enrique Zavala"
            ]
        )// nueva minuta
        
        minutas.append(nueva)
    }//agregarMinutaDemo
    
} // struct

#Preview {
    MinutasView(onLogout: {})
}
