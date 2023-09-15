//
//  FetchUserSessionTokenService.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 14/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine

public protocol FetchCredentialsService {
    func use(
        input: FetchCredentialsServiceInput
    ) -> AnyPublisher<FetchCredentialsServiceOutput, Error>
}

public struct FetchCredentialsServiceInput {
    let username: String
    let password: String
}

public struct FetchCredentialsServiceOutput {
    let bearerToken: String
    let refreshToken: String
    let customerID: String
}

//class DefaultFetchCredentialsService: FetchCredentialsService {
//    private let network: Network
//    
//    init(network: Network) {
//        self.network = network
//    }
//    
//    func use(input: FetchCredentialsServiceInput) -> AnyPublisher<FetchCredentialsServiceOutput, Error> {
//       
//    }
//}

//let allowId = "007"
//let allowUsername = "james"
//let allowPassword = "bond"
//guard
//    username.lowercased() == allowUsername,
//    password.lowercased() == allowPassword
//else {
//    return Fail(error: NSError()).eraseToAnyPublisher()
//}

//
//return Just<Customer>(Customer(id: "007", name: "James", surname: "Bond"))
//    .setFailureType(to: Error.self)
//    .eraseToAnyPublisher()

