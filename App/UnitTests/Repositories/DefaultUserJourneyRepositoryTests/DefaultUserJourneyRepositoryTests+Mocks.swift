//
//  DefaultUserJourneyRepositoryTests+Mocks.swift
//  App Unit Tests
//
//  Created by Hardijs Ķirsis on 24/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import XCTest
import SwiftyUserDefaults
@testable import SWEDBANK

extension DefaultUserJourneyRepositoryTests {
    final class Constants {
        static let userDefaultsStore = UserDefaults(suiteName: XCTestCase.userDefaultsSuiteName)!
        static let userDefaultsSpy = DefaultsAdapter<DefaultsKeys>(
            defaults: userDefaultsStore,
            keyStore: .init()
        )
    }
}

extension DefaultUserJourneyRepositoryTests {
    func makeSUT() -> DefaultUserJourneyRepository {
        DefaultUserJourneyRepository(defaultsStore: Constants.userDefaultsStore)
    }
}
