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
    
    // MARK: Lifeycle
    public init(manager: UserSessionManager) {
        self.manager = manager
    }
    
    // MARK: Methods
    public func use() -> AnyPublisher<Void, Never> {
        guard let startedSession = manager.startedUserSessions.first?.value else {
            return .just(())
        }
        
        manager.deleteUserSession(credentialsID: startedSession.credentials.id)
        return .just(())
    }
}
