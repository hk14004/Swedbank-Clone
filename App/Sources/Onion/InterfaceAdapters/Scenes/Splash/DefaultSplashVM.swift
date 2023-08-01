//
//  DefaultSplashVM.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 01/08/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine

class DefaultSplashVM: SplashVM {
        
    // MARK: Properties
    
    var router: SplashVMRouter
    var onStartLoading: AnyPublisher<Void, Never> = CurrentValueSubject<Void, Never>(()).eraseToAnyPublisher()
    
    // MARK: Lifecycle
    
    init(router: SplashVMRouter) {
        self.router = router
    }
}

// MARK: Input

extension DefaultSplashVM {
    func onViewDidLoad() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.router.onRouteToHome()
        }
    }
}
