//
//  MockLoginService.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Ķirsis on 24/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine

class MockLoginService: StartSessionService {
    var mockResult: AnyPublisher<StartSessionServiceOutput, Error>!
    func use(input: StartSessionServiceInput) -> AnyPublisher<StartSessionServiceOutput, Error> {
        mockResult
    }
}
