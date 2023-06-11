//
//  LoginScreenVMImpl.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 11/06/2023.
//

import Combine
import DevToolsCore

class LoginScreenVMImpl {
    
    // MARK: Properties
    
    let navigationBindings: LockedTabScreenVMNavigationBindings = .init()
    @Published var inputFieldState: [LoginScreenInputField: LoginScreenInputFieldState] = [
        .password: .initial,
        .username: .initial
    ]
    
    var inputFieldStatePublisher: Published<[LoginScreenInputField: LoginScreenInputFieldState]>.Publisher {
        $inputFieldState
    }
    
    private var validators: [LoginScreenInputField: Validator] = [
        .username: LoginUsernameValidator(),
        .password: LoginPasswordValidator()
    ]
    
    private var inputs: [LoginScreenInputField: String] = [
        .username: "",
        .password: ""
    ]
    
    private let authProvider = DI.container.resolve(AuthCredentialsProvider.self)!
    private let sessionManager = DI.container.resolve(BaseUserSessionManager<SwedbankUserSessionCredentials>.self)!
}

// MARK: LoginScreenVM

extension LoginScreenVMImpl: LoginScreenVM {
    func onTextFieldInputChanged(type: LoginScreenInputField, input: String) {
        inputs[type] = input
    }
    
    func onAuthTapped() {
        let valid = validateInputs()
        if valid {
            Task {
                await performLogin(username: inputs[.username]!, passw: inputs[.password]!)
            }
        }
    }
    
    func onRecoverPassword() {}
    
}

// MARK: Private

extension LoginScreenVMImpl {
    private func performLogin(username: String, passw: String) async {
        do {
            let creds = try await authProvider.getAuthCredentials(username: username)
            sessionManager.credentialsStore.storeCredentials(creds)
            sessionManager.startUserSession(with: creds)
            navigationBindings.onLoggedIn?()
        } catch (let err) {
            print(err)
        }
    }
    
    private func validateInputs() -> Bool {
        var valid = true
        var newState = inputFieldState
        LoginScreenInputField.allCases.forEach { field in
            let validator = validators[field]!
            let input = inputs[field]!
            let err = validator.validate(input).first ?? ""
            if err.isEmpty {
                newState[field] = .valid
            } else {
                newState[field] = .invalid(err)
                valid = false
            }
        }
        inputFieldState = newState
        return valid
    }
}

fileprivate class LoginUsernameValidator: Validator {
    func validate(_ input: String) -> [ErrorMessage] {
        var errors: [String] = []
        if input.isEmpty {
            errors.append("Globals.InputField.mustNotBeEmpty".runtimeLocalized())
        }
        
        return errors
    }
}

fileprivate class LoginPasswordValidator: Validator {
    func validate(_ input: String) -> [ErrorMessage] {
        var errors: [String] = []
        if input.isEmpty {
            errors.append("Globals.InputField.mustNotBeEmpty".runtimeLocalized())
        }
        
        let minSize = 6
        if input.count < minSize {
            let format = "Globals.InputField.mustBeAtleastSize".runtimeLocalized()
            let error = String(format: format, "\(minSize)")
            errors.append(error)
        }
        
        return errors
    }
}
