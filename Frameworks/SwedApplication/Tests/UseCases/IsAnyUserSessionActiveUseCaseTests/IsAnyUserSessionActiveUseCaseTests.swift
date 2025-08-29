//
//  IsAnyUserSessionActiveUseCaseTests.swift
//  SwedApplicationBusinessRulesTest
//
//  Created by Hardijs Ķirsis on 22/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import XCTest
@testable import SwedApplication

final class IsAnyUserSessionActiveUseCaseTests: XCTestCase {
    let mocks = Mocks()
    
    func testUse() {
        // Arrange
        let sut = makeSUT()
        let expectManagerCall = expectation(description: "expectManagerCall")
        let expected = true
        mocks.mockUserSessionManager.isSomebodyLoggedInMock = expected
        mocks.mockUserSessionManager.isSomebodyLoggedInCalledSpy = {
            expectManagerCall.fulfill()
        }
        
        // Act
        let result = sut.use()
        
        // Assert
        waitForExpectations(timeout: defaultTimeout)
        XCTAssertEqual(result, expected)
    }
}
