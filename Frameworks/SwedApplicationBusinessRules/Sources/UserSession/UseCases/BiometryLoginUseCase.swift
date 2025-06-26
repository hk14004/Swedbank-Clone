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
import SwedLocalization

public protocol BiometryLoginUseCase {
    func use(customerID: String) -> AnyPublisher<Customer, Error>
}

public class DefaultBiometryLoginUseCase: BiometryLoginUseCase {
    // MARK: Properties
    private let context = LAContext()
    
    // MARK: lifeCycle
    public init() {}
    
    // MARK: Methods
    public func use(customerID: String) -> AnyPublisher<Customer, Error> {
        var error: NSError?
        guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            return .fail(BiometryError.biometryNotAvailable)
        }
        
        return Future<Customer, Error> { promise in
            self.context.evaluatePolicy(
                .deviceOwnerAuthenticationWithBiometrics,
                localizedReason: SwedLocalization.Permissions.Biometry.authReason
            ) { success, authenticationError in
                guard success else {
                    if let laError = authenticationError as? LAError {
                        promise(.failure(BiometryError.underlyingError(laError)))
                    } else {
                        promise(.failure(BiometryError.biometryNotAvailable))
                    }
                    return
                }
                promise(.success(JAMES_BOND))
            }
        }
        .eraseToAnyPublisher()
    }
}
