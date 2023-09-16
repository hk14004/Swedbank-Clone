//
//  LoginVM.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine
import DevToolsCore
import SwedApplicationBusinessRules

public protocol LoginScreenVMInput {
    func viewDidLoad()
    func onLoginTapped(username: String, password: String)
    func onRecoverPasswordTapped()
}

public protocol LoginScreenVMOutput {
    var router: LoginScreenRouter? { get set}
    var loading: CurrentValueSubject<Bool, Never> { get }
}

public protocol LoginScreenVM: LoginScreenVMInput,LoginScreenVMOutput {}

public class DefaultLoginScreenVM: LoginScreenVM {
    public var router: LoginScreenRouter?
    private(set) public var loading: CurrentValueSubject<Bool, Never> = .init(false)
    private let loginUseCase: LoginUseCase
    private var bag = Set<AnyCancellable>()
    
    public init(loginUseCase: LoginUseCase) {
        self.loginUseCase = loginUseCase
    }
    
}

// MARK: - LoginVMInput
public extension DefaultLoginScreenVM {
    func viewDidLoad() {}
    
    func onLoginTapped(username: String, password: String) {
        loading.send(true)
        loginUseCase.use(username: username, password: password)
            .receiveOnMainThread()
            .sink { [weak self] completion in
                self?.handleLoginCompletion(completion)
            } receiveValue: { [weak self] customer in
                self?.onLoggedIn(customer: customer)
            }
            .store(in: &bag)
        
    }
    
    func onRecoverPasswordTapped() {}
}

extension DefaultLoginScreenVM {
    private func onLoggedIn(customer: CustomerDTO) {
        print("Route to dashboard with customer:", customer.name)
    }
    
    private func handleLoginCompletion(_ completion: Subscribers.Completion<Error>) {
        loading.send(false)
        switch completion {
        case .finished:
            print("Login finished")
        case .failure(let error):
            printError(error)
        }
    }
}
