//
//  SaveAppLaunchDateUseCase.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

protocol SaveAppTerminationDateUseCase {
    func use(terminationDate: Date?)
}

struct DefaultSaveAppTerminationDateUseCase: SaveAppTerminationDateUseCase {
    
    private let applicationActivityRepository: ApplicationActivityRepository
    
    init(applicationActivityRepository: ApplicationActivityRepository) {
        self.applicationActivityRepository = applicationActivityRepository
    }
    
    func use(terminationDate: Date?) {
        applicationActivityRepository.saveTerminationDate(date: Date())
    }
    
}
