//
//  PinAuthenticateUseCase.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine

public protocol PinAuthenticateUseCase {
    func use(customerID: String, pinCode: String) -> AnyPublisher<Void, Error>
}

public struct DefaultPinAuthenticateUseCase: PinAuthenticateUseCase {
    
    public init() {}
    
    public func use(customerID: String, pinCode: String) -> AnyPublisher<Void, Error> {
        if pinCode == "007", customerID == pinCode {
            return .just(())
        } else {
            return .fail(UserSessionError.invalidLoginCredentials)
        }
    }
}
