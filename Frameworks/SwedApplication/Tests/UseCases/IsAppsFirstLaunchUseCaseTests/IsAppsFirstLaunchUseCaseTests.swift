//
//  IsAppsFirstLaunchUseCaseTests.swift
//  SwedApplicationBusinessRulesTest
//
//  Created by Hardijs Ķirsis on 22/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import XCTest
@testable import SwedApplication

final class IsAppsFirstLaunchUseCaseTests: XCTestCase {
    let mocks = Mocks()
    
    func testUse() {
        // Arrange
        let sut = makeSUT()
        let expectGetCalled = expectation(description: "expectGetCalled")
        mocks.mockApplicationActivityRepository.getTerminationDateMock = nil
        mocks.mockApplicationActivityRepository.getTerminationDateCalledSpy = {
            expectGetCalled.fulfill()
        }
        // Act
        let result = sut.use()
        
        // Assert
        waitForExpectations(timeout: defaultTimeout)
        XCTAssertTrue(result)
    }
}
