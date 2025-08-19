//
//  FetchRemoteOffersService.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Kirsis on 26/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine
import Application

public protocol FetchRemoteOffersService {
    func use() -> AnyPublisher<FetchRemoteOffersServiceOutput, Error>
}

public typealias FetchRemoteOffersServiceOutput = [Offer]
