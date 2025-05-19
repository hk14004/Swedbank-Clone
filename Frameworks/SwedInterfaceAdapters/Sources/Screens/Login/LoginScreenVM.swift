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
    func onFaceIDTapped()
    func onLanguageChangeTap()
    func onAddDigit(_ digit: String)
    func onRemoveDigit()
}

public protocol LoginScreenVMOutput {
    var router: LoginScreenRouter! { get set}
    var loadingPublisher: Bool { get }
    var customerName: String { get }
    var maxPinLength: Int { get }
    var currentPin: String { get }
}

public protocol LoginScreenVM: ObservableObject, LoginScreenVMInput, LoginScreenVMOutput {}

public class DefaultLoginScreenVM: LoginScreenVM {
    // MARK: Constant
    enum Constant {
        static let customer = CustomerDTO(id: "007", displayName: "James Bond")
    }
    
    // MARK: Properties
    @Published public var loadingPublisher: Bool = false
    @Published public var currentPin: String = ""
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
    func onAddDigit(_ digit: String) {
        guard currentPin.count < maxPinLength else { return }
        currentPin.append(digit)
        if currentPin.count == maxPinLength {
            attemptLogin(pinCode: currentPin)
        }
    }
    
    func onRemoveDigit() {
        guard currentPin.count > 0 else { return }
        currentPin.removeLast()
    }
    
    func onLanguageChangeTap() {
        router.routeToLanguageSelectionScreen()
    }
    
    func onFaceIDTapped() {}
}

// MARK: Private
extension DefaultLoginScreenVM {
    private func attemptLogin(pinCode: String) {
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
    
    private func onLoggedIn(customer: CustomerDTO) {
        router.routeToLoginCompleted(customer: customer)
    }
    
    private func handleLoginCompletion(_ completion: Subscribers.Completion<Error>) {
        loadingPublisher = false
        currentPin = ""
        switch completion {
        case .finished:
            return
        case .failure(let error):
            printError(error)
            router.routeToErrorAlert(error)
        }
    }
}
