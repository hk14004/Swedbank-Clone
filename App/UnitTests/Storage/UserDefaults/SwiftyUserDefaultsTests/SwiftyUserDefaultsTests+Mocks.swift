//
//  SwiftyUserDefaultsTests+Mocks.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 15/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import XCTest
import SwiftyUserDefaults

extension SwiftyUserDefaultsTests {
    enum Constants {
        static var testSuiteName = "TestUserDefaults"
        static var testKey = "TestKey"
    }
    
    struct TestKeyStore: DefaultsKeyStore {
        var testKey: DefaultsKey<String> { .init(Constants.testKey, defaultValue: "") }
        public init() {}
    }
    
    class Mocks {
        var userDefaults: UserDefaults!
        
        func defaultConfiguration() {
            userDefaults = UserDefaults(suiteName: Constants.testSuiteName)
            userDefaults.removePersistentDomain(forName: Constants.testSuiteName)
        }
        
        func makeSUT() -> DefaultsAdapter<TestKeyStore> {
            DefaultsAdapter<TestKeyStore>(defaults: userDefaults, keyStore: .init())
        }
    }
}
