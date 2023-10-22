//
//  AppDelegateTest.swift
//  App Unit Tests
//
//  Created by Hardijs Ķirsis on 22/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import XCTest
@testable import SWEDBANK

final class AppDelegateTest: XCTestCase {

    // MARK: - Properties
    var mocks = Mocks()

    // MARK: - Methods
    func makeSUT() -> AppDelegate {
        let delegate = AppDelegate()
        delegate.saveAppLaunchDateUseCase = mocks.mockSaveAppLaunchDateUseCase
        delegate.saveAppTerminationDateUseCase = mocks.mockSaveAppTerminationDateUseCase
        return delegate
    }
}
