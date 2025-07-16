//
//  TrackCachedOffersUseCase.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Kirsis on 26/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine

public protocol TrackCachedAccountsUseCase {
    func use() -> AnyPublisher<[Account], Never>
}

public struct DefaultTrackCachedAccountsUseCase: TrackCachedAccountsUseCase {
    private let accountRepository: AccountRepository
    
    public init(accountRepository: AccountRepository) {
        self.accountRepository = accountRepository
    }
    
    public func use() -> AnyPublisher<[Account], Never> {
        accountRepository.observeCachedList()
    }
}
