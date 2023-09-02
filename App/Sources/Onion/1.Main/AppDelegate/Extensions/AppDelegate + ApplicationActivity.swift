//
//  AppDelegate + ApplicationActivity.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 02/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

extension AppDelegate {
    func registerApplicationLaunch() {
        let repository: ApplicationActivityRepository = Composition.resolve()
        repository.saveLaunchDate(date: Date())
    }
    func registerApplicationTermination() {
        let repository: ApplicationActivityRepository = Composition.resolve()
        repository.saveTerminationDate(date: Date())
    }
}
