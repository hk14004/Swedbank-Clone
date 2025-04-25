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
    private let isOnboardingCompletedUseCase: isOnboardingCompletedUseCase
    private let startAllUserSessionsUseCase: StartAllUserSessionsUseCase
    private let getCurrentCustomerUseCase: GetCurrentCustomerUseCase
    @Published private var isLoading: Bool = false
    private var cancelBag = Set<AnyCancellable>()
    
    // MARK: Lifecycle
    
    public init(
        isOnboardingCompletedUseCase: isOnboardingCompletedUseCase,
        startAllUserSessionsUseCase: StartAllUserSessionsUseCase,
        getCurrentCustomerUseCase: GetCurrentCustomerUseCase
    ) {
        self.isOnboardingCompletedUseCase = isOnboardingCompletedUseCase
        self.startAllUserSessionsUseCase = startAllUserSessionsUseCase
        self.getCurrentCustomerUseCase = getCurrentCustomerUseCase
    }
}

// MARK: Input

public extension DefaultSplashVM {
    func onViewDidLoad() {
//        guard isOnboardingCompletedUseCase.use() else {
//            router?.routeToOnboarding()
//            return
//        }
        startAllUserSessionsUseCase.use()
        getCurrentCustomerUseCase.use()
            .receiveOnMainThread()
            .sink { [weak self] customer in
                self?.router?.initRouteToRoot(customer: customer)
        }
        .store(in: &cancelBag)
    }
}
