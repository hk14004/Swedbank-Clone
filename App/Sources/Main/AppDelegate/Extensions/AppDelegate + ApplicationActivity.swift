//
//  AppDelegate + ApplicationActivity.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 02/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedApplicationBusinessRules

extension AppDelegate {
    func registerApplicationLaunch() {
        let useCase: SaveAppLaunchDateUseCase = Composition.resolve()
        useCase.use(launchDate: Date())
    }
    func registerApplicationTermination() {
        let useCase: SaveAppTerminationDateUseCase = Composition.resolve()
        useCase.use(terminationDate: Date())
    }
}
