//
//  AppDelegate+ApplicationActivity.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 02/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import Application

extension AppDelegate {
    func registerApplicationLaunch() {
        let saveAppLaunchDateUseCase: SaveAppLaunchDateUseCase = Composition.resolve()
        saveAppLaunchDateUseCase.use(launchDate: Date())
    }
    func registerApplicationTermination() {
        let saveAppTerminationDateUseCase: SaveAppTerminationDateUseCase = Composition.resolve()
        saveAppTerminationDateUseCase.use(terminationDate: Date())
    }
}
