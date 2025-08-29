//
//  SaveAppLaunchDateUseCaseTests+Mocks.swift
//  SwedApplicationBusinessRulesTest
//
//  Created by Hardijs Ķirsis on 22/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import XCTest
@testable import SwedApplication

extension SaveAppLaunchDateUseCaseTests {
    final class Mocks {
        var mockApplicationActivityRepository = MockApplicationActivityRepository()
    }
}

extension SaveAppLaunchDateUseCaseTests {
    func makeSUT() -> DefaultSaveAppLaunchDateUseCase {
        DefaultSaveAppLaunchDateUseCase(
            applicationActivityRepository: mocks.mockApplicationActivityRepository
        )
    }
}
