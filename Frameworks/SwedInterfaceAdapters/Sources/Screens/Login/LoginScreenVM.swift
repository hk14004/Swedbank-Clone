//
//  LoginScreenVM.swift
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
    func onLoginAttempt(pinCode: String)
    func onFaceIDTapped()
    func onLanguageChangeTap()
}

public protocol LoginScreenVMOutput {
    var router: LoginScreenRouter! { get set}
    var loadingPublisher: Bool { get }
    var customerName: String { get }
    var maxPinLength: Int { get }
}

public protocol LoginScreenVM: ObservableObject, LoginScreenVMInput, LoginScreenVMOutput {}

public class DefaultLoginScreenVM: LoginScreenVM {
    // MARK: Constant
    enum Constant {
        static let customer = CustomerDTO(id: "007", displayName: "James Bond")
    }
    
    // MARK: Properties
    @Published public var loadingPublisher: Bool = false
    public var maxPinLength: Int { 3 }
    public var customerName: String { Constant.customer.displayName }
    public var router: LoginScreenRouter!
    private let loginUseCase: LoginUseCase
    private var bag = Set<AnyCancellable>()
    
    // MARK: Lifecycle
    public init(loginUseCase: LoginUseCase) {
        self.loginUseCase = loginUseCase
    }
    
}

// MARK: - Public
public extension DefaultLoginScreenVM {
    func onLoginAttempt(pinCode: String) {
        loadingPublisher = true
        loginUseCase.use(customerID: Constant.customer.id, pinCode: pinCode)
            .receiveOnMainThread()
            .sink { [weak self] completion in
                self?.handleLoginCompletion(completion)
            } receiveValue: { [weak self] customer in
                self?.onLoggedIn(customer: customer)
            }
            .store(in: &bag)
    }
    func onLanguageChangeTap() {
        router.routeToLanguageSelectionScreen()
    }
    func onFaceIDTapped() {}
}

// MARK: Private
extension DefaultLoginScreenVM {
    private func onLoggedIn(customer: CustomerDTO) {
        router.routeToLoginCompleted(customer: customer)
    }
    
    private func handleLoginCompletion(_ completion: Subscribers.Completion<Error>) {
        loadingPublisher = false
        switch completion {
        case .finished:
            return
        case .failure(let error):
            printError(error)
        }
    }
}
