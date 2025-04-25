//
//  DefaultUserSessionCredentialsStoreTests.swift
//  App Unit Tests
//
//  Created by Hardijs Ķirsis on 16/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import XCTest
@testable import SWEDBANK
@testable import SwedApplicationBusinessRules

// TODO: Add more tests
final class DefaultUserSessionCredentialsStoreTests: XCTestCase {

    var mocks: Mocks!
    var sut: DefaultUserSessionCredentialsStore!
    
    override func setUpWithError() throws {
        mocks = Mocks()
        mocks.defaultConfiguration()
        sut = mocks.makeSUT()
    }

    override func tearDownWithError() throws {
        sut = nil
        mocks = nil
    }
    
    func test_storeCredentials() {
        // Act
        sut.storeCredentials(mocks.credentials)
        
        // Assert
        guard let data = try? mocks.keychain.getData(Constants.credentialsID) else {
            XCTFail("No data")
            return
        }
        let loaded = try? JSONDecoder().decode(UserSessionCredentials.self, from: data)
        XCTAssertEqual(loaded, mocks.credentials)
    }
}
