//
//  BiometryLoginUseCase.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Kirsis on 25/06/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine
import LocalAuthentication
import Localization

public protocol BiometryAuthenticateUseCase {
    func use(customerID: String) -> AnyPublisher<Void, Error>
}

public class DefaultBiometryAuthenticateUseCase: BiometryAuthenticateUseCase {
    // MARK: Properties
    private let context = LAContext()
    
    // MARK: lifeCycle
    public init() {}
    
    // MARK: Methods
    public func use(customerID: String) -> AnyPublisher<Void, Error> {
        var error: NSError?
        guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            return .fail(BiometryError.biometryNotAvailable)
        }
        
        return Future<Void, Error> { promise in
            self.context.evaluatePolicy(
                .deviceOwnerAuthenticationWithBiometrics,
                localizedReason: Localization.Permissions.Biometry.authReason
            ) { success, authenticationError in
                guard success else {
                    if let laError = authenticationError as? LAError {
                        promise(.failure(BiometryError.underlyingError(laError)))
                    } else {
                        promise(.failure(BiometryError.biometryNotAvailable))
                    }
                    return
                }
                promise(.success(()))
            }
        }
        .eraseToAnyPublisher()
    }
}
