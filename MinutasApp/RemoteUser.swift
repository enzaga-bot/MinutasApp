//
//  RemoteUser.swift
//  MinutasApp
//
//  Created by Enrique Zavala Garcia on 06/12/25.
//

import Foundation

struct RemoteUser: Identifiable, Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
}
