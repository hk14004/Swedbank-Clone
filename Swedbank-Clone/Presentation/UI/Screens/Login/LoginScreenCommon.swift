//
//  LoginScreenCommon.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 11/06/2023.
//

import Foundation
import DevToolsCore

enum LoginScreenInputField: String, CaseIterable {
    case username
    case password
}

enum LoginScreenInputFieldState {
    case initial
    case valid
    case invalid(String)
}

class LoginScreenVMNavigationBindings {
    var onLoggedIn: VoidCallback?
    var onRecoverPassword: VoidCallback?
}

protocol LoginScreenVM: ObservableObject {
    var navigationBindings: LockedTabScreenVMNavigationBindings { get }
    var inputFieldStatePublisher: Published<[LoginScreenInputField: LoginScreenInputFieldState]>.Publisher { get }
    
    func onTextFieldInputChanged(type: LoginScreenInputField, input: String)
    func onAuthTapped()
    func onRecoverPassword()
}
