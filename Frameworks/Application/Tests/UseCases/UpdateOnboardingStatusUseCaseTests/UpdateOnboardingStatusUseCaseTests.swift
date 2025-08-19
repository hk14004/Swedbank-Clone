//
//  UpdateOnboardingStatusUseCaseTests.swift
//  SwedApplicationBusinessRulesTest
//
//  Created by Hardijs Ķirsis on 22/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import XCTest
@testable import Application

final class UpdateOnboardingStatusUseCaseTests: XCTestCase {
    let mocks = Mocks()
    
    func testUse() {
        // Arrange
        let sut = makeSUT()
        let expectedCompleted = true
        var actualCompleted: Bool?
        let expectUpdateCalled = expectation(description: "expectUpdateCalled")
        mocks.mockUserJourneyRepository.updateOnboardingCalledSpy = { value in
            actualCompleted = value
            expectUpdateCalled.fulfill()
        }
        
        // Act
        sut.use(completed: expectedCompleted)
        
        // Assert
        waitForExpectations(timeout: defaultTimeout)
        XCTAssertEqual(actualCompleted, expectedCompleted)
    }
}
