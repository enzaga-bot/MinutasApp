//
//  NuevaMinutaView.swift
//  MinutasApp
//
//  Created by Enrique Zavala Garcia on 06/12/25.
//

import SwiftUI

struct NuevaMinutaView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    // Callback que recibe la nueva minuta
    let onGuardar: (Minuta) -> Void
    
    @State private var fecha: String = ""
    @State private var hora: String = ""
    @State private var asistentesTexto: String = ""
    @State private var puntosTexto: String = ""
    @State private var acuerdosTexto: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
//componente reutilizable con @Binding.
                Section(header: Text("Datos generales")) {
                    LabeledTextField(
                        title: "Fecha",
                        placeholder: "Fecha de la reunión",
                        text: $fecha
                    )
                    
                    LabeledTextField(
                        title: "Hora",
                        placeholder: "Horario (ej. 10:30am - 12:00pm)",
                        text: $hora
                    )
                }
                
                Section(header: Text("Asistentes")) {
                    LabeledTextField(
                        title: "Asistentes",
                        placeholder: "Nombres separados por coma",
                        text: $asistentesTexto
                    )
                }
                
                Section(header: Text("Puntos / Orden del día")) {
                    TextEditor(text: $puntosTexto)
                        .frame(minHeight: 80)
                }
                
                Section(header: Text("Acuerdos")) {
                    TextEditor(text: $acuerdosTexto)
                        .frame(minHeight: 80)
                }
                
                Section {
                    Button(action: guardarMinuta) {
                        HStack {
                            Spacer()
                            Text("Guardar minuta")
                                .fontWeight(.semibold)
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Nueva minuta")
        }
    }
    
    private func guardarMinuta() {
        let fechaLimpia = fecha.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let tituloGenerado = fechaLimpia.isEmpty
            ? "Minuta sin título"
            : "Minuta del \(fechaLimpia)"
        
        let asistentes = asistentesTexto
            .split(separator: ",")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
        
        let puntos = puntosTexto
            .split(whereSeparator: \.isNewline)
            .map { String($0).trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
        
        let acuerdosArray = acuerdosTexto
            .split(whereSeparator: \.isNewline)
            .map { String($0).trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
        
        let nuevaMinuta = Minuta(
            titulo: tituloGenerado,
            fecha: fechaLimpia,
            hora: hora,
            ordenDelDia: puntos,
            asistentes: asistentes,
            acuerdos: acuerdosArray.isEmpty ? nil : acuerdosArray
        )
        
        onGuardar(nuevaMinuta)
        dismiss()
    }
}

#Preview {
    NuevaMinutaView(onGuardar: { _ in })
}


