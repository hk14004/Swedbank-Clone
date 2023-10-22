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
        saveAppLaunchDateUseCase.use(launchDate: Date())
    }
    func registerApplicationTermination() {
        saveAppTerminationDateUseCase.use(terminationDate: Date())
    }
}
