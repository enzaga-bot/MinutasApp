//
//  SectionTitleView.swift
//  MinutasApp
//
//  Created by Enrique Zavala Garcia on 06/12/25.
//

import SwiftUI

struct SectionTitleView: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .font(.headline)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 16)
    }
}

#Preview {
    SectionTitleView(text: "Orden del día")
}
