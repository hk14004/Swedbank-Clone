//
//  GetCompletedOnboardingUseCaseTests.swift
//  SwedApplicationBusinessRulesTest
//
//  Created by Hardijs Ķirsis on 22/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import XCTest
@testable import SwedApplication

final class GetCompletedOnboardingUseCaseTests: XCTestCase {
    let mocks = Mocks()
    
    func testUse() {
        // Arrange
        let sut = makeSUT()
        let expectGetOnboardingCalled = expectation(description: "expectGetOnboardingCalled")
        mocks.mockUserJourneyRepository.getCompletedOnboardingMock = true
        mocks.mockUserJourneyRepository.getCompletedOnboardingCalledSpy = {
            expectGetOnboardingCalled.fulfill()
        }
        
        // Act
        let result = sut.use()
        
        // Assert
        waitForExpectations(timeout: defaultTimeout)
        XCTAssertTrue(result)
    }
}
