//
//  DefaultApplicationActivityRepository.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 02/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import KeychainAccess
import SwedApplicationBusinessRules

class DefaultApplicationActivityRepository: ApplicationActivityRepository {
    
    let keychain = Keychain(service: "com.example.github-token")
    
    func getLaunchDate() -> Date? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        guard let data = keychain[data: ApplicationActivityFlag.launchDate.rawValue] else {
            return nil
        }
        return try? decoder.decode(Date.self, from: data)
    }
    
    func saveLaunchDate(date: Date?) {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .secondsSince1970
        guard let data = try? encoder.encode(date) else {
            return
        }
        keychain[data: ApplicationActivityFlag.launchDate.rawValue] = data
    }
    
    func getTerminationDate() -> Date? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        guard let data = keychain[data: ApplicationActivityFlag.terminationDate.rawValue] else {
            return nil
        }
        return try? decoder.decode(Date.self, from: data)
    }
    
    func saveTerminationDate(date: Date?) {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .secondsSince1970
        guard let data = try? encoder.encode(date) else {
            return
        }
        keychain[data: ApplicationActivityFlag.terminationDate.rawValue] = data
    }
    
    
}
