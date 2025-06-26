//
//  LogoutUseCase.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Ķirsis on 31/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Combine

public protocol LogoutUseCase {
    func use() -> AnyPublisher<Void, Never>
}

public class DefaultLogoutUseCase: LogoutUseCase {
    // MARK: Properties
    private let manager: UserSessionManager
    private let nukeCustomerPersistedDataUseCase: NukeCustomerPersistedDataUseCase
    
    // MARK: Lifeycle
    public init(
        manager: UserSessionManager,
        nukeCustomerPersistedDataUseCase: NukeCustomerPersistedDataUseCase
    ) {
        self.manager = manager
        self.nukeCustomerPersistedDataUseCase = nukeCustomerPersistedDataUseCase
    }
    
    // MARK: Methods
    public func use() -> AnyPublisher<Void, Never> {
        guard let startedSession = manager.startedUserSessions.first?.value else {
            return nukeCustomerPersistedDataUseCase.use()
        }
        
        manager.deleteUserSession(credentialsID: startedSession.credentials.id)
        return nukeCustomerPersistedDataUseCase.use()
    }
}
