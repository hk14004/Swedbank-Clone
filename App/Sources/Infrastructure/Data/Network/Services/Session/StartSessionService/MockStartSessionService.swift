//
//  MockStartSessionService.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 28/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine
import Application

class MockStartSessionService: StartSessionService {
    func use(input: StartSessionServiceInput) -> AnyPublisher<StartSessionServiceOutput, Error> {
        guard input.username == JAMES_BOND.id, input.password == JAMES_BOND.id else {
            return .fail(NSError(domain: "invalid credentials, try 007", code: 0))
        }
        return .just(
            StartSessionServiceOutput(
                bearerToken: "accessToken123",
                refreshToken: "refreshToken123",
                expirationDuration: 3600,
                userID: input.username
            )
        )
        .eraseToAnyPublisher()
    }
}
