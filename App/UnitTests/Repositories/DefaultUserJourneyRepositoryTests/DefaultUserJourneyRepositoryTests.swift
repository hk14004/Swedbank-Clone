//
//  DefaultUserJourneyRepositoryTests.swift
//  App Unit Tests
//
//  Created by Hardijs Ķirsis on 24/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import XCTest
import SwiftyUserDefaults
@testable import SWEDBANK

final class DefaultUserJourneyRepositoryTests: XCTestCase {

    override func setUpWithError() throws {
        Constants.userDefaultsSpy.removeAll()
    }
    
    func testUpdateOnboarding_toTrue() {
        // Arrange
        let expectedCompleted = true
        let sut = makeSUT()
        
        // Act
        sut.update(completedOnboarding: expectedCompleted)
        
        // Assert
        XCTAssertEqual(expectedCompleted, Constants.userDefaultsSpy[\.isOnboardingCompleted])
    }
    
    func testUpdateOnboarding_toFalse() {
        // Arrange
        let expectedCompleted = false
        let sut = makeSUT()
        
        // Act
        sut.update(completedOnboarding: expectedCompleted)
        
        // Assert
        XCTAssertEqual(expectedCompleted, Constants.userDefaultsSpy[\.isOnboardingCompleted])
    }
    
    func testGetOnboarding_whenFalse() {
        // Arrange
        let expectedCompleted = false
        let spy = Constants.userDefaultsSpy
        spy[\.isOnboardingCompleted] = expectedCompleted
        let sut = makeSUT()
        
        // Act
        let result = sut.getIsOnboardingCompleted()
        
        // Assert
        XCTAssertEqual(expectedCompleted, result)
    }
    
    func testGetOnboarding_whenTrue() {
        // Arrange
        let expectedCompleted = true
        let spy = Constants.userDefaultsSpy
        spy[\.isOnboardingCompleted] = expectedCompleted
        let sut = makeSUT()
        
        // Act
        let result = sut.getIsOnboardingCompleted()
        
        // Assert
        XCTAssertEqual(expectedCompleted, result)
    }
}
