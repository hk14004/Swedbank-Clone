//
//  AuthCredentialsProviderImpl.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 10/06/2023.
//

import Foundation

class AuthCredentialsProviderImpl {
    
}

extension AuthCredentialsProviderImpl: AuthCredentialsProvider {
    func getAuthCredentials(username: String) async throws -> SwedbankUserSessionCredentials {
        if username == VALID_ID {
            return .init(id: username, authorizationData: .init(bearerToken: BEARER_TOKEN,
                                                                refreshToken: REFRESH_TOKEN))
        }
        
        throw AuthCredentialsProviderError.userUnknown
    }
}
