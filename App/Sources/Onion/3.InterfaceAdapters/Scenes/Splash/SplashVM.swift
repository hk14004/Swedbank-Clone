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
    
    // MARK: Lifecycle
    
    init() {}
}

// MARK: Input

extension DefaultSplashVM {
    func onViewDidLoad() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.router?.onRouteToHome()
        }
    }
}
