//
//  AppDelegateTest+Mocks.swift
//  App Unit Tests
//
//  Created by Hardijs Ķirsis on 22/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

@testable import SwedApplicationBusinessRules

extension AppDelegateTest {
    final class Mocks {
        lazy var mockSaveAppLaunchDateUseCase = MockSaveAppLaunchDateUseCase()
        lazy var mockSaveAppTerminationDateUseCase = MockSaveAppTerminationDateUseCase()
    }
}

