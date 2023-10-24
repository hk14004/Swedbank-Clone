//
//  LoginUseCaseTests.swift
//  SwedApplicationBusinessRulesTest
//
//  Created by Hardijs Ķirsis on 24/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import XCTest
@testable import SwedApplicationBusinessRules

final class LoginUseCaseTests: XCTestCase {
    
    let mocks = Mocks()
    
    func testUse() throws {
        // Arrange
        let sut = makeSUT()
        let mockOutput = LoginServiceOutput(bearerToken: "", refreshToken: "", expirationDuration: 0)
        mocks.mockLoginService.mockResult = .just(mockOutput)
        let expectedUsername = "James"
        let expectedPassword = "Pass"
        // Act
        let _ = sut.use(username: expectedUsername, password: expectedPassword)
        
        // Assert
    }
}
