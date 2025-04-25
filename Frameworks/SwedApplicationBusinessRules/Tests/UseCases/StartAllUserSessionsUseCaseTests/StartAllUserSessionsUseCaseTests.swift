//
//  StartAllUserSessionsTests.swift
//  SwedApplicationBusinessRulesTest
//
//  Created by Hardijs Ķirsis on 24/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import XCTest
@testable import SwedApplicationBusinessRules

final class StartAllUserSessionsUseCaseTests: XCTestCase {
    let mocks = Mocks()
    
    func testUse() {
        // Arrange
        let sut = makeSUT()
        let expectStartCall = expectation(description: "expectStartCall")
        mocks.mockUserSessionManager.startAllUserSessionsCalledSpy = {
            expectStartCall.fulfill()
        }
        
        // Act
        sut.use()
        
        // Assert
        waitForExpectations(timeout: defaultTimeout)
    }
}
