//
//  FetchRemoteCustomersService.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 30/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Combine
import SwedApplication

public protocol FetchRemoteCustomersService {
    func use() -> AnyPublisher<FetchRemoteCustomersServiceOutput, Error>
}

public typealias FetchRemoteCustomersServiceOutput = [Customer]
