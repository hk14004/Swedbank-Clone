//
//  KeychainAccessTests+Mocks.swift
//  App Unit Tests
//
//  Created by Hardijs Ķirsis on 16/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import XCTest
import KeychainAccess

extension KeychainAccessTests {
    enum Constants {
        static let testService = "TestService"
    }
    
    class Mocks {
        func defaultConfiguration() {}
        
        func makeSUT() -> Keychain {
            Keychain(service: Constants.testService)
        }
    }
}
