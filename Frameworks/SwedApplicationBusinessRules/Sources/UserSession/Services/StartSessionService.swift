//
//  CreateSessionService.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 14/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine

public protocol StartSessionService {
    func use(input: StartSessionServiceInput) -> AnyPublisher<StartSessionServiceOutput, Error>
}

public struct StartSessionServiceInput {
    public let username: String
    public let password: String
}

public struct StartSessionServiceOutput {
    public let bearerToken: String
    public let refreshToken: String
    public let expirationDuration: Int
    
    public init(bearerToken: String, refreshToken: String, expirationDuration: Int) {
        self.bearerToken = bearerToken
        self.refreshToken = refreshToken
        self.expirationDuration = expirationDuration
    }
}
