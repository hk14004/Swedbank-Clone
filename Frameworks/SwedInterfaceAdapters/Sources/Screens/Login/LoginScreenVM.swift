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
    // MARK: Properties
    @Published public var loadingPublisher: Bool = false
    @Published public var currentPin: String = ""
    public var maxPinLength: Int { 3 }
    public var customerName: String { customer.displayName }
    public var router: LoginScreenRouter!
    private let pinLoginUseCase: PinAuthenticateUseCase
    private let getLastCustomerUseCase: GetLastCustomerUseCase
    private let biometryLoginUseCase: BiometryAuthenticateUseCase
    private var customer: Customer
    private var bag = Set<AnyCancellable>()
    
    // MARK: Lifecycle
    public init(
        customer: Customer,
        pinLoginUseCase: PinAuthenticateUseCase,
        getLastCustomerUseCase: GetLastCustomerUseCase,
        biometryLoginUseCase: BiometryAuthenticateUseCase
    ) {
        self.customer = customer
        self.pinLoginUseCase = pinLoginUseCase
        self.getLastCustomerUseCase = getLastCustomerUseCase
        self.biometryLoginUseCase = biometryLoginUseCase
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
    
    func onFaceIDTapped() {
        loadingPublisher = true
        biometryLoginUseCase.use(customerID: customer.id)
            .receiveOnMainThread()
            .sink { [weak self] completion in
                self?.handleLoginCompletion(completion)
            } receiveValue: { [weak self] customer in
                self?.onLoggedIn()
            }
            .store(in: &bag)
    }
}

// MARK: Private
extension DefaultLoginScreenVM {
    private func attemptLogin(pinCode: String) {
        loadingPublisher = true
        pinLoginUseCase.use(customerID: customer.id, pinCode: pinCode)
            .receiveOnMainThread()
            .sink { [weak self] completion in
                self?.handleLoginCompletion(completion)
            } receiveValue: { [weak self] customer in
                self?.onLoggedIn()
            }
            .store(in: &bag)
    }
    
    private func onLoggedIn() {
        router.routeToLoginCompleted(customer: customer)
    }
    
    private func handleLoginCompletion(_ completion: Subscribers.Completion<Error>) {
        loadingPublisher = false
        currentPin = ""
        switch completion {
        case .finished:
            return
        case .failure(let error):
            if let error = error as? BiometryError {
                switch error {
                case .biometryNotAvailable:
                    break
                case .underlyingError(let systemError):
                    switch systemError.code {
                    case .userCancel:
                        return
                    default:
                        break
                    }
                }
            }
            router.routeToOkeyErrorAlert(error, onDismiss: nil)
        }
    }
}
