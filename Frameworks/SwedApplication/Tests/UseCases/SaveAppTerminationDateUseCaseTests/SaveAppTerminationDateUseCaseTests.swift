//
//  SaveAppTerminationDateUseCaseTests.swift
//  SwedApplicationBusinessRulesTest
//
//  Created by Hardijs Ķirsis on 22/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import XCTest
@testable import SwedApplication

final class SaveAppTerminationDateUseCaseTests: XCTestCase {
    let mocks = Mocks()
    
    func testUse() {
        // Arrange
        let sut = makeSUT()
        let expectedTerminationDate = Date()
        var actualTerminationDate: Date?
        let expectTermination = expectation(description: "expectTermination")
        mocks.mockApplicationActivityRepository.saveTerminationDateCalledSpy = { date in
            actualTerminationDate = date
            expectTermination.fulfill()
        }
        
        // Act
        sut.use(terminationDate: expectedTerminationDate)
        
        // Assert
        waitForExpectations(timeout: defaultTimeout)
        XCTAssertEqual(expectedTerminationDate, actualTerminationDate)
    }
}
