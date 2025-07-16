//
//  SplashVM.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/07/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine
import SwedApplicationBusinessRules

public protocol SplashScreenVM: SplashVMInput, SplashVMOutput {}

public protocol SplashVMInput {
    func onViewDidLoad()
}

public protocol SplashVMOutput {
    var isLoadingPublisher: AnyPublisher<Bool, Never> { get }
    var router: SplashScreenRouter? { get set }
}

public class DefaultSplashVM: SplashScreenVM {
    // MARK: Properties
    public var router: SplashScreenRouter?
    public var isLoadingPublisher: AnyPublisher<Bool, Never> { $isLoading.eraseToAnyPublisher() }
    private let fakeAlreadyLoggedInUseCase: FakeAlreadyLoggedInUseCase
    private let getLastCustomerUseCase: GetLastCustomerUseCase
    private let startUserSessionUseCase: StartUserSessionUseCase
    @Published private var isLoading: Bool = false
    private var cancelBag = Set<AnyCancellable>()
    
    // MARK: Lifecycle
    
    public init(
        fakeAlreadyLoggedInUseCase: FakeAlreadyLoggedInUseCase,
        getLastCustomerUseCase: GetLastCustomerUseCase,
        startUserSessionUseCase: StartUserSessionUseCase
    ) {
        self.fakeAlreadyLoggedInUseCase = fakeAlreadyLoggedInUseCase
        self.getLastCustomerUseCase = getLastCustomerUseCase
        self.startUserSessionUseCase = startUserSessionUseCase
    }
}

// MARK: Input

public extension DefaultSplashVM {
    func onViewDidLoad() {
        guard let customer = getLastCustomerUseCase.use() else {
            fatalError("TODO: Implement login flow")
        }
        fakeAlreadyLoggedInUseCase.use()
            .flatMap { _ in
                self.startUserSessionUseCase.use(customer: customer)
            }
            .receiveOnMainThread()
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.router?.routeToOkeyErrorAlert(error, onDismiss: nil)
                case .finished:
                    break
                }
            } receiveValue: { [weak self] _ in
                self?.router?.initRouteToRoot(customer: customer)
            }
            .store(in: &cancelBag)
    }
}
