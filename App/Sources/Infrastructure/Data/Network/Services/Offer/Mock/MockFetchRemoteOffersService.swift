//
//  MockFetchRemoteOffersService.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Kirsis on 27/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Combine
import SwedApplicationBusinessRules

class MockFetchRemoteOffersService: FetchRemoteOffersService {
    var mockResult: AnyPublisher<FetchRemoteOffersServiceOutput, Never>!
    func use() -> AnyPublisher<FetchRemoteOffersServiceOutput, Never> {
        mockResult
    }
}
