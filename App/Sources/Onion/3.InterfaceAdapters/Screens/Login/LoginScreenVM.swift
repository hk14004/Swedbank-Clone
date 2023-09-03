//
//  LoginVM.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

protocol LoginScreenVMInput {
    func viewDidLoad()
    func onLoginTapped()
    func onRecoverPasswordTapped()
}

protocol LoginScreenVMOutput {
    var router: LoginScreenRouter? { get set}
}

protocol LoginScreenVM: LoginScreenVMInput,LoginScreenVMOutput {}

class DefaultLoginScreenVM: LoginScreenVM {
    
    var router: LoginScreenRouter?
    
}

// MARK: - LoginVMInput
extension DefaultLoginScreenVM {
    func viewDidLoad() {}
    
    func onLoginTapped() {}
    
    func onRecoverPasswordTapped() {}
}
