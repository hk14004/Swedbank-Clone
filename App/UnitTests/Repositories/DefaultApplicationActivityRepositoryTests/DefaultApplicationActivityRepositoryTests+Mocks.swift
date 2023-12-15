//
//  DefaultApplicationActivityRepositoryTests+Mocks.swift
//  App Unit Tests
//
//  Created by Hardijs Ķirsis on 25/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import XCTest
import SwiftyUserDefaults
@testable import SWEDBANK

extension DefaultApplicationActivityRepositoryTests {
    final class Constants {
        static let userDefaultsStore = UserDefaults(suiteName: XCTestCase.userDefaultsSuiteName)!
        static let userDefaultsSpy = DefaultsAdapter<DefaultsKeys>(
            defaults: userDefaultsStore,
            keyStore: .init()
        )
    }
}

extension DefaultApplicationActivityRepositoryTests {
    func makeSUT() -> DefaultApplicationActivityRepository {
        DefaultApplicationActivityRepository(defaultsStore: Constants.userDefaultsStore)
    }
}
