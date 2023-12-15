//
//  DefaultApplicationActivityRepositoryTests.swift
//  App Unit Tests
//
//  Created by Hardijs Ķirsis on 25/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import XCTest
@testable import SWEDBANK

final class DefaultApplicationActivityRepositoryTests: XCTestCase {

    override func setUpWithError() throws {
        Constants.userDefaultsSpy.removeAll()
    }
    
    func testUpdateLaunchDate() {
        // Arrange
        let expectedDate = Date()
        let sut = makeSUT()
        
        // Act
        sut.saveLaunchDate(date: expectedDate)
        
        // Assert
        XCTAssertEqual(expectedDate, Constants.userDefaultsSpy[\.appLaunchDate])
    }
    
    func testUpdateTerminationDate() {
        // Arrange
        let expectedDate = Date()
        let sut = makeSUT()
        
        // Act
        sut.saveTerminationDate(date: expectedDate)
        
        // Assert
        XCTAssertEqual(expectedDate, Constants.userDefaultsSpy[\.appTerminationDate])
    }
    
    func testGetLaunchDate() {
        // Arrange
        let expectedDate = Date()
        let spy = Constants.userDefaultsSpy
        spy[\.appLaunchDate] = expectedDate
        let sut = makeSUT()
        
        // Act
        let result = sut.getLaunchDate()
        
        // Assert
        XCTAssertEqual(expectedDate, result)
    }
    
    func testGetTerminationDate() {
        // Arrange
        let expectedDate = Date()
        let spy = Constants.userDefaultsSpy
        spy[\.appTerminationDate] = expectedDate
        let sut = makeSUT()
        
        // Act
        let result = sut.getTerminationDate()
        
        // Assert
        XCTAssertEqual(expectedDate, result)
    }
    
}
