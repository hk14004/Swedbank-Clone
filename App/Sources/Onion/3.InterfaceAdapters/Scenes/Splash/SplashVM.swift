//
//  SplashVM.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/07/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine

protocol SplashVM: SplashVMInput, SplashVMOutput {}

protocol SplashVMInput {
    func onViewDidLoad()
}

protocol SplashVMOutput {
    var onStartLoading: AnyPublisher<Void, Never> { get }
    var router: SplashRouter? { get set }
}

class DefaultSplashVM: SplashVM {
        
    // MARK: Properties
    
    var router: SplashRouter?
    var onStartLoading: AnyPublisher<Void, Never> = CurrentValueSubject<Void, Never>(()).eraseToAnyPublisher()
    private let isAnyUserSessionActiveUseCase: IsAnyUserSessionActiveUseCase
    
    // MARK: Lifecycle
    
    init(isAnyUserSessionActiveUseCase: IsAnyUserSessionActiveUseCase) {
        self.isAnyUserSessionActiveUseCase = isAnyUserSessionActiveUseCase
    }
}

// MARK: Input

extension DefaultSplashVM {
    func onViewDidLoad() {
        if isAnyUserSessionActiveUseCase.use() {
            
        } else {
            
        }
    }
}
