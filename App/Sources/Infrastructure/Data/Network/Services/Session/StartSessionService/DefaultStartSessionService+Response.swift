//
//  DefaultStartSessionService+Response.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 28/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwedApplicationBusinessRules

extension DefaultStartSessionService {
    struct StartSessionResponse: Codable {
        let accessToken: String
        let refreshToken: String
        let id: Int
        
        func mapToDomain() -> StartSessionServiceOutput {
            StartSessionServiceOutput(
                bearerToken: accessToken,
                refreshToken: refreshToken,
                expirationDuration: TOKEN_EXPIRE_TIME_IN_MINS,
                userID: "\(id)"
            )
        }
    }
}
