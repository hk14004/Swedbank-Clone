//
//  NetworkClientSessionExpiredPlugin.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 29/07/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Combine

public protocol NetworkClientSessionExpiredPlugin {
    func handleSessionExpired() -> AnyPublisher<Void, Never>
}
