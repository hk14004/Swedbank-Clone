//
//  MockLoginService.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Ķirsis on 24/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine

class MockLoginService: LoginService {
    var mockResult: AnyPublisher<LoginServiceOutput, Error>!
    func use(input: LoginServiceInput) -> AnyPublisher<LoginServiceOutput, Error> {
        mockResult
    }
}
