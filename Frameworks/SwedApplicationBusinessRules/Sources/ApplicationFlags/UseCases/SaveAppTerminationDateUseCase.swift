//
//  SaveAppLaunchDateUseCase.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

public protocol SaveAppTerminationDateUseCase {
    func use(terminationDate: Date?)
}

public struct DefaultSaveAppTerminationDateUseCase: SaveAppTerminationDateUseCase {
    
    private let applicationActivityRepository: ApplicationActivityRepository
    
    public init(applicationActivityRepository: ApplicationActivityRepository) {
        self.applicationActivityRepository = applicationActivityRepository
    }
    
    public func use(terminationDate: Date? = Date()) {
        applicationActivityRepository.saveTerminationDate(date: terminationDate)
    }
    
}
