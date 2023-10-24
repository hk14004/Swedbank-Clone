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
    func getCredentials(id: String) -> UserSessionCredentials?
    func deleteCredentials(id: String)
}
