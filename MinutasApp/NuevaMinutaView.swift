//
//  NuevaMinutaView.swift
//  MinutasApp
//
//  Created by Enrique Zavala Garcia on 06/12/25.
//

import SwiftUI

struct NuevaMinutaView: View {
    
    @State private var fecha: String = ""
    @State private var hora: String = ""
    @State private var asistentesTexto: String = ""
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(header: Text("Datos Generales")) {
                    TextField("Fecha", text: $fecha)
                    TextField("Hora", text: $hora)
                }//Section
                
                Section(header: Text("Asistentes")) {
                    TextField("Separa los Nombres por comas", text: $asistentesTexto)
                }//Section
            }//Form
            .navigationTitle("Nueva Minuta")
        }//NavigationView
        
    }//body
    
    
} //NuevaMinutaView


#Preview {
    NuevaMinutaView()
}
