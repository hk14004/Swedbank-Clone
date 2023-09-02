//
//  AppDelegate + ApplicationActivity.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 02/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

extension AppDelegate {
    func registerApplicationOpen() {
        let repository: ApplicationActivityRepository = Composition.resolve()
        repository.saveLastOpenDate(date: Date())
    }
    func registerApplicationClose() {
        let repository: ApplicationActivityRepository = Composition.resolve()
        repository.saveLastCloseDate(date: Date())
    }
}
