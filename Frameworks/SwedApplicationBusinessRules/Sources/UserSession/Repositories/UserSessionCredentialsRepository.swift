//
//  UserSessionCredentialsRepository.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 02/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

public protocol UserSessionCredentialsRepository {
    func save(credentials: UserSessionCredentials)
    func get(id: String) -> UserSessionCredentials
    func delete(id: String)
}
