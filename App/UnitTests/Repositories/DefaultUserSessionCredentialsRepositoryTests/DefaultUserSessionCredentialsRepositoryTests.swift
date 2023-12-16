//
//  DefaultUserSessionCredentialsRepositoryTests.swift
//  App Unit Tests
//
//  Created by Hardijs Ķirsis on 16/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import XCTest
@testable import SWEDBANK

// TODO: more tests
final class DefaultUserSessionCredentialsRepositoryTests: XCTestCase {

    var mocks: Mocks!
    var sut: DefaultUserSessionCredentialsRepository!
    
    override func setUpWithError() throws {
        mocks = Mocks()
        mocks.defaultConfiguration()
        sut = mocks.makeSUT()
    }

    override func tearDownWithError() throws {
        mocks = nil
        sut = nil
    }

    func test_save() throws {
        // Arrange
        let saveCalledExpectation = expectation(description: "saveCalledExpectation")
        mocks.store.storeCredentialsCalled = { _ in
            saveCalledExpectation.fulfill()
        }
        
        // Act
        sut.save(credentials: mocks.credentials)
        
        // Assert
        waitForExpectations(timeout: defaultTimeout)
    }

}
