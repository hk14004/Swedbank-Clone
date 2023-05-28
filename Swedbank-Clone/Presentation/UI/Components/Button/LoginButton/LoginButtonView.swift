//
//  LoginButtonView.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 27/05/2023.
//

import SwiftUI

struct LoginButtonView: View {
    
    let action: (() -> Void)
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Spacer()
                Text("Login.Button.title".localizedRuntimeString())
                Spacer()
            }
        }
        .buttonStyle(LoginButtonStyle())
    }
}

struct LoginButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LoginButtonView {
            
        }
    }
}
