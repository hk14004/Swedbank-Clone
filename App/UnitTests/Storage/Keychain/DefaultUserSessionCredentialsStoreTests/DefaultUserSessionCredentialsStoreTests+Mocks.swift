//
//  DefaultUserSessionCredentialsStoreTests+Mocks.swift
//  App Unit Tests
//
//  Created by Hardijs Ķirsis on 16/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import KeychainAccess
@testable import SWEDBANK
@testable import SwedApplicationBusinessRules

extension DefaultUserSessionCredentialsStoreTests {
    enum Constants {
        static let testService = "TestService"
        static let credentialsID = "id"
        static let bearerToken = "bearerToken"
        static let refreshToken = "refreshToken"
    }
    
    class Mocks {
        var keychain: Keychain!
        let credentials = UserSessionCredentials(
            id: Constants.credentialsID,
            authorizationData: .init(
                bearerToken: Constants.bearerToken,
                refreshToken: Constants.refreshToken
            )
        )
        
        func defaultConfiguration() {
            keychain = Keychain(service: Constants.testService)
            try? keychain.removeAll()
        }
        
        func makeSUT() -> DefaultUserSessionCredentialsStore {
            DefaultUserSessionCredentialsStore(keychain: keychain)
        }
    }
}
