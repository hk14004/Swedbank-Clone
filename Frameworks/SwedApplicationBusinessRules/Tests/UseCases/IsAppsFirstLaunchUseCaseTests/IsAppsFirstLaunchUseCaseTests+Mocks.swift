//
//  IsAppsFirstLaunchUseCaseTests+Mocks.swift
//  SwedApplicationBusinessRulesTest
//
//  Created by Hardijs Ķirsis on 22/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
@testable import SwedApplicationBusinessRules

extension IsAppsFirstLaunchUseCaseTests {
    final class Mocks {
        var mockApplicationActivityRepository = MockApplicationActivityRepository()
    }
}

extension IsAppsFirstLaunchUseCaseTests {
    func makeSUT() -> DefaultIsAppsFirstLaunchUseCase {
        DefaultIsAppsFirstLaunchUseCase(
            applicationActivityRepository: mocks.mockApplicationActivityRepository
        )
    }
}
