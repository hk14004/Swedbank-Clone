//
//  SaveAppLaunchDateUseCase.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

public protocol SaveAppLaunchDateUseCase {
    func use(launchDate: Date?)
}

public struct DefaultSaveAppLaunchDateUseCase: SaveAppLaunchDateUseCase {
    
    private let applicationActivityRepository: ApplicationActivityRepository
    
    public init(applicationActivityRepository: ApplicationActivityRepository) {
        self.applicationActivityRepository = applicationActivityRepository
    }
    
    public func use(launchDate: Date?) {
        applicationActivityRepository.saveLaunchDate(date: launchDate)
    }
    
}
