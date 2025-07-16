//
//  RefreshSessionService.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 14/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine

public protocol RefreshSessionService {
    func use(input: RefreshSessionServiceInput) -> AnyPublisher<RefreshSessionServiceOutput, Error>
}

public struct RefreshSessionServiceInput: Codable {
    public let refreshToken: String
    
    public init(refreshToken: String) {
        self.refreshToken = refreshToken
    }
}

public struct RefreshSessionServiceOutput: Codable {
    public let accessToken: String
    public let refreshToken: String
    public let expiresIn: Int
}
