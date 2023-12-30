//
//  FetchRemoteCustomersService.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 14/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine

public protocol FetchRemoteCustomersService {
    func use() -> AnyPublisher<FetchRemoteCustomersServiceOutput, Error>
}

public typealias FetchRemoteCustomersServiceOutput = [CustomerDTO]
