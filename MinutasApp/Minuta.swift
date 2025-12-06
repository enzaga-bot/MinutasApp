//
//  Minuta.swift
//  MinutasApp
//
//  Created by Enrique Zavala Garcia on 04/12/25.
//

import Foundation

//Esta estrucutura puede codificar y descodificar
struct Minuta: Codable {
    
    let titulo: String
    let fecha: String
    let hora: String
    let ordenDelDia: [String]
    let asistentes: [String]
    
}
