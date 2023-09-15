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

protocol LoginScreenVMInput {
    func viewDidLoad()
    func onLoginTapped(username: String, password: String)
    func onRecoverPasswordTapped()
}

protocol LoginScreenVMOutput {
    var router: LoginScreenRouter? { get set}
    var loading: CurrentValueSubject<Bool, Never> { get }
}

protocol LoginScreenVM: LoginScreenVMInput,LoginScreenVMOutput {}

class DefaultLoginScreenVM: LoginScreenVM {
    var router: LoginScreenRouter?
    private(set) var loading: CurrentValueSubject<Bool, Never> = .init(false)
    private let loginUseCase: LoginUseCase
    private var bag = Set<AnyCancellable>()
    
    init(loginUseCase: LoginUseCase) {
        self.loginUseCase = loginUseCase
    }
    
}

// MARK: - LoginVMInput
extension DefaultLoginScreenVM {
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
        print("Route to dashboard")
    }
    
    private func handleLoginCompletion(_ completion: Subscribers.Completion<Error>) {
        loading.send(false)
        switch completion {
        case .finished:
            print("load")
        case .failure(let error):
            printError(error)
        }
    }
}
