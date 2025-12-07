//
//  AppConfig.swift
//  MinutasApp
//
//  Created by Enrique Zavala Garcia on 06/12/25.
//

import Foundation

enum AppConfig {
    static var apiBaseURL: String {
        Bundle.main.object(forInfoDictionaryKey: "API_BASE_URL") as? String ?? ""
    }
}
