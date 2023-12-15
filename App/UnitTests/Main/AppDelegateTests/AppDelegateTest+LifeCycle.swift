//
//  AppDelegateTests+LifeCycle.swift
//  App Unit Tests
//
//  Created by Hardijs Ķirsis on 22/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import XCTest
@testable import SWEDBANK
@testable import SwedApplicationBusinessRules

extension AppDelegateTests {
    func testAppLaunch_didRegisterStartup() {
        // Arrange
        let sut = makeSUT()
        let didCallRegisterStartupDate = expectation(description: "didCallRegisterStartupDate")
        let expectedDate = Date()
        var actualDate: Date!
        mocks.mockSaveAppLaunchDateUseCase.useCalledSpy = { date in
            actualDate = date
            didCallRegisterStartupDate.fulfill()
        }
        
        // Act
        let _ = sut.application(UIApplication.shared, didFinishLaunchingWithOptions: [:])
        
        // Assert
        waitForExpectations(timeout: defaultTimeout)
        let distance = expectedDate.distance(to: actualDate)
        XCTAssertTrue(distance < 1)
    }
    
    func testAppTerminate_didRegisterTermination() {
        // Arrange
        let sut = makeSUT()
        let didCallRegisterTerminationDate = expectation(description: "didCallRegisterTerminationDate")
        let expectedDate = Date()
        var actualDate: Date!
        mocks.mockSaveAppTerminationDateUseCase.useCalledSpy = { date in
            actualDate = date
            didCallRegisterTerminationDate.fulfill()
        }
        
        // Act
        sut.applicationWillTerminate(UIApplication.shared)
        
        // Assert
        waitForExpectations(timeout: defaultTimeout)
        let distance = expectedDate.distance(to: actualDate)
        XCTAssertTrue(distance < 1)
    }
}
