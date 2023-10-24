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
    private let isAnyUserSessionActiveUseCase: IsAnyUserSessionActiveUseCase
    private let isOnboardingCompletedUseCase: isOnboardingCompletedUseCase
    private let startAllUserSessionsUseCase: StartAllUserSessionsUseCase
    @Published private var isLoading: Bool = false
    
    // MARK: Lifecycle
    
    public init(
        isAnyUserSessionActiveUseCase: IsAnyUserSessionActiveUseCase,
        isOnboardingCompletedUseCase: isOnboardingCompletedUseCase,
        startAllUserSessionsUseCase: StartAllUserSessionsUseCase
    ) {
        self.isAnyUserSessionActiveUseCase = isAnyUserSessionActiveUseCase
        self.isOnboardingCompletedUseCase = isOnboardingCompletedUseCase
        self.startAllUserSessionsUseCase = startAllUserSessionsUseCase
    }
}

// MARK: Input

public extension DefaultSplashVM {
    func onViewDidLoad() {
        guard isOnboardingCompletedUseCase.use() else {
            router?.routeToOnboarding()
            return
        }
        startAllUserSessionsUseCase.use()
        router?.routeToDashboard()
    }
}
