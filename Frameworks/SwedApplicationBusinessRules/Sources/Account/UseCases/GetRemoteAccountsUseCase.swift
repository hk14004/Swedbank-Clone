//
//  GetRemoteAccountsUseCase.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Kirsis on 26/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine

public protocol GetRemoteAccountsUseCase {
    func use() -> AnyPublisher<[Account], Never>
}

public struct DefaultGetRemoteAccountsUseCase: GetRemoteAccountsUseCase {
    private let accountRepository: AccountRepository
    
    public init(accountRepository: AccountRepository) {
        self.accountRepository = accountRepository
    }
    
    public func use() -> AnyPublisher<[Account], Never> {
        accountRepository.getRemoteAccounts()
    }
}
