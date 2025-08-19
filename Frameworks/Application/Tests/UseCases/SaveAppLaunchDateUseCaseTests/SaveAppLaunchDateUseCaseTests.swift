//
//  SaveAppLaunchDateUseCaseTests.swift
//  SwedApplicationBusinessRulesTest
//
//  Created by Hardijs Ķirsis on 22/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import XCTest
@testable import Application

final class SaveAppLaunchDateUseCaseTests: XCTestCase {

    let mocks = Mocks()

    func testUse() {
        // Arrange
        let sut = makeSUT()
        let expectedLaunchDate = Date()
        var actualLaunchDate: Date?
        let expectSaveCalled = expectation(description: "expectSaveCalled")
        mocks.mockApplicationActivityRepository.saveLaunchDateCalledSpy = { actual in
            actualLaunchDate = actual
            expectSaveCalled.fulfill()
        }
        // Act
        sut.use(launchDate: expectedLaunchDate)
        
        // Assert
        waitForExpectations(timeout: defaultTimeout)
        XCTAssertEqual(actualLaunchDate, expectedLaunchDate)
    }
}
