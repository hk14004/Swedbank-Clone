//
//  LoginButtonStyle.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 27/05/2023.
//

import SwiftUI

struct LoginButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .padding()
            .background(configuration.isPressed ? Color.orange.opacity(0.5) : Color.orange)
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}

#Preview {
    Button {
        
    } label: {
        Text("Button")
    }
    .buttonStyle(LoginButtonStyle())
}
