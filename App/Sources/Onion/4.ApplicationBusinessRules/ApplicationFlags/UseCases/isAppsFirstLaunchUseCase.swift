//
//  isAppsFirstLaunchUseCase.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 02/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

protocol isAppsFirstLaunchUseCase {
    func use() -> Bool
}

struct DefaultIsAppsFirstLaunchUseCase: isAppsFirstLaunchUseCase {
    
    private let applicationActivityRepository: ApplicationActivityRepository
    
    init(applicationActivityRepository: ApplicationActivityRepository) {
        self.applicationActivityRepository = applicationActivityRepository
    }
    
    func use() -> Bool {
        return applicationActivityRepository.getLastCloseDate() == nil
    }
    
}
