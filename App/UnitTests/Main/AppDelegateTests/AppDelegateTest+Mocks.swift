//
//  AppDelegateTests+Mocks.swift
//  App Unit Tests
//
//  Created by Hardijs Ķirsis on 22/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

@testable import SWEDBANK
@testable import SwedApplicationBusinessRules

extension AppDelegateTests {
    final class Mocks {
        let mockSaveAppLaunchDateUseCase = MockSaveAppLaunchDateUseCase()
        let mockSaveAppTerminationDateUseCase = MockSaveAppTerminationDateUseCase()
    }
}

extension AppDelegateTests {
    func makeSUT() -> AppDelegate {
        let delegate = AppDelegate()
        delegate.saveAppLaunchDateUseCase = mocks.mockSaveAppLaunchDateUseCase
        delegate.saveAppTerminationDateUseCase = mocks.mockSaveAppTerminationDateUseCase
        return delegate
    }
}
