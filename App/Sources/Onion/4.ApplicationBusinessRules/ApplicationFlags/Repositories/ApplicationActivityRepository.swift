//
//  ApplicationFlagRepository.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 02/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

protocol ApplicationActivityRepository {
    func getLastOpenDate() -> Date?
    func saveLastOpenDate(date: Date?)
    func getLastCloseDate() -> Date?
    func saveLastCloseDate(date: Date?)
}
