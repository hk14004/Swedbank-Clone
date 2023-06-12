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
            .background(configuration.isPressed ? Asset.Colors.color3.swiftUIColor.opacity(0.5) : Asset.Colors.color3.swiftUIColor)
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}

struct LoginButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button {
            
        } label: {
            Text("Button")
        }
        .buttonStyle(LoginButtonStyle())
    }
}
