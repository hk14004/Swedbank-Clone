//
//  DefaultUserSessionCredentialsRepositoryTests+Mocks.swift
//  App Unit Tests
//
//  Created by Hardijs Ķirsis on 16/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import DevToolsCore
import SwedApplicationBusinessRules
@testable import SWEDBANK

extension DefaultUserSessionCredentialsRepositoryTests {
    enum Constants {
        static let testService = "TestService"
        static let credentialsID = "id"
        static let bearerToken = "bearerToken"
        static let refreshToken = "refreshToken"
    }
    
    class MockedUserStore: BaseUserSessionCredentialsStore<UserSessionCredentials> {
        var storeCredentialsCalled: ((UserSessionCredentials)->())?
        override func storeCredentials(_ credentials: UserSessionCredentials) {
            storeCredentialsCalled?(credentials)
        }
    }
    
    class Mocks {
        var store: MockedUserStore!
        let credentials = UserSessionCredentials(
            id: Constants.credentialsID,
            authorizationData: .init(
                bearerToken: Constants.bearerToken,
                refreshToken: Constants.refreshToken
            )
        )
        
        func defaultConfiguration() {
            store = MockedUserStore()
        }
        
        func makeSUT() -> DefaultUserSessionCredentialsRepository {
            DefaultUserSessionCredentialsRepository(
                store: store
            )
        }
    }
}
