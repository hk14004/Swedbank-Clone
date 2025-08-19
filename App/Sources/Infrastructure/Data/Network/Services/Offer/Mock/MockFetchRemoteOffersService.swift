//
//  MockFetchRemoteOffersService.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Kirsis on 27/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Combine
import Application

class MockFetchRemoteOffersService: FetchRemoteOffersService {
    var mockResult: AnyPublisher<FetchRemoteOffersServiceOutput, Error>!
    func use() -> AnyPublisher<FetchRemoteOffersServiceOutput, Error> {
        mockResult
    }
}
