//
//  DefaultStartSessionService+Response.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 28/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import Application

extension DefaultStartSessionService {
    struct StartSessionResponse: Codable {
        let accessToken: String
        let refreshToken: String
        let expiresIn: Int
        
        func mapToDomain(id: String) -> StartSessionServiceOutput {
            StartSessionServiceOutput(
                bearerToken: accessToken,
                refreshToken: refreshToken,
                expirationDuration: expiresIn,
                userID: id
            )
        }
    }
}
