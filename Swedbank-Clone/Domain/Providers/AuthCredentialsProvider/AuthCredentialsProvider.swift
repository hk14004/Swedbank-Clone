//
//  AuthCredentialsProvider.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 10/06/2023.
//

import Foundation

enum AuthCredentialsProviderError: Swift.Error {
    case userUnknown
    case connectivityIssue
}

protocol AuthCredentialsProvider {
    func getAuthCredentials(username: String) async throws -> SwedbankUserSessionCredentials
}
