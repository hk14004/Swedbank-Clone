//
//  SaveAppLaunchDateUseCase.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

protocol SaveAppLaunchDateUseCase {
    func use(launchDate: Date?)
}

struct DefaultSaveAppLaunchDateUseCase: SaveAppLaunchDateUseCase {
    
    private let applicationActivityRepository: ApplicationActivityRepository
    
    init(applicationActivityRepository: ApplicationActivityRepository) {
        self.applicationActivityRepository = applicationActivityRepository
    }
    
    func use(launchDate: Date?) {
        applicationActivityRepository.saveLaunchDate(date: launchDate)
    }
    
}
