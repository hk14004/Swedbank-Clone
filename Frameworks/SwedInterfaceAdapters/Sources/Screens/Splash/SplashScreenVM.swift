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
    @Published private var isLoading: Bool = false
    private var cancelBag = Set<AnyCancellable>()
    
    // MARK: Lifecycle
    
    public init(
        fakeAlreadyLoggedInUseCase: FakeAlreadyLoggedInUseCase,
        getLastCustomerUseCase: GetLastCustomerUseCase,
    ) {
        self.fakeAlreadyLoggedInUseCase = fakeAlreadyLoggedInUseCase
        self.getLastCustomerUseCase = getLastCustomerUseCase
    }
}

// MARK: Input

public extension DefaultSplashVM {
    func onViewDidLoad() {
        fakeAlreadyLoggedInUseCase.use()
            .receiveOnMainThread()
            .sink { [weak self] _ in
                guard let self else { return }
                guard let customer = getLastCustomerUseCase.use() else {
                    self.router?.routeToOkeyErrorAlert(NSError(), onDismiss: nil)
                    return
                }
                router?.initRouteToRoot(customer: customer)
            }
            .store(in: &cancelBag)
    }
}
