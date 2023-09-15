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

protocol SplashScreenVM: SplashVMInput, SplashVMOutput {}

protocol SplashVMInput {
    func onViewDidLoad()
}

protocol SplashVMOutput {
    var onStartLoading: AnyPublisher<Void, Never> { get }
    var router: SplashScreenRouter? { get set }
}

class DefaultSplashVM: SplashScreenVM {
        
    // MARK: Properties
    
    var router: SplashScreenRouter?
    var onStartLoading: AnyPublisher<Void, Never> = CurrentValueSubject<Void, Never>(()).eraseToAnyPublisher()
    private let isAnyUserSessionActiveUseCase: IsAnyUserSessionActiveUseCase
    private let getCompletedOnboardingUseCase: GetCompletedOnboardingUseCase
    private let startAllUserSessionsUseCase: StartAllUserSessionsUseCase
    
    // MARK: Lifecycle
    
    init(
        isAnyUserSessionActiveUseCase: IsAnyUserSessionActiveUseCase,
        getCompletedOnboardingUseCase: GetCompletedOnboardingUseCase,
        startAllUserSessionsUseCase: StartAllUserSessionsUseCase
    ) {
        self.isAnyUserSessionActiveUseCase = isAnyUserSessionActiveUseCase
        self.getCompletedOnboardingUseCase = getCompletedOnboardingUseCase
        self.startAllUserSessionsUseCase = startAllUserSessionsUseCase
    }
}

// MARK: Input

extension DefaultSplashVM {
    func onViewDidLoad() {
        guard getCompletedOnboardingUseCase.use() else {
            router?.routeToOnboarding()
            return
        }
        startAllUserSessionsUseCase.use()
        router?.routeToDashboard()
    }
}
