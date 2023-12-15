//
//  SwiftyUserDefaultsTests.swift
//  App Unit Tests
//
//  Created by Hardijs Ķirsis on 15/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import XCTest
import SwiftyUserDefaults

final class SwiftyUserDefaultsTests: XCTestCase {
    var mocks: Mocks!
    var sut: DefaultsAdapter<TestKeyStore>!
    
    override func setUpWithError() throws {
        mocks = Mocks()
        mocks.defaultConfiguration()
        sut = mocks.makeSUT()
    }

    override func tearDownWithError() throws {
        mocks = nil
        sut = nil
    }

    func testWrite() {
        // Arrange
        let testValue = UUID().uuidString

        // Act
        sut[\.testKey] = testValue

        // Assert
        XCTAssertEqual(mocks.userDefaults.string(forKey: Constants.testKey), testValue)
    }
    
    func testRead() {
        // Arrange
        let testValue = UUID().uuidString
        mocks.userDefaults.set(testValue, forKey: Constants.testKey)

        // Act
        let result = sut[\.testKey]

        // Assert
        XCTAssertEqual(result, testValue)
    }
}
