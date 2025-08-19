//
//  DefaultNetworkClientSessionExpiredPlugin.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 29/07/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import UIKit
import Combine
import SwedApplicationBusinessRules
import SwedInterfaceAdapters

class DefaultNetworkClientSessionExpiredPlugin: NetworkClientSessionExpiredPlugin {
    
    private let logoutUseCase: LogoutUseCase
    
    init(logoutUseCase: LogoutUseCase) {
        self.logoutUseCase = logoutUseCase
    }
    
    func handleSessionExpired() -> AnyPublisher<Void, Never> {
        logoutUseCase.use()
            .receiveOnMainThread()
            .flatMap { [weak self]_ in
                return Future<Void, Never> { promise in
                    self?.routeToSplashScreen()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        promise(.success(()))
                    }
                }
            }
            .eraseToAnyPublisher()
    }
}

extension DefaultNetworkClientSessionExpiredPlugin: ToSplashScreenRouting {}
