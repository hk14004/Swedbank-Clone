//
//  AccountRepository.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Kirsis on 26/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Combine
import SwedEnterpriseBusinessRules
import Foundation

public protocol AccountRepository {
    func replace(with items: [AccountDTO]) -> AnyPublisher<Void, Never>
    func getRemoteAccounts() -> AnyPublisher<[AccountDTO], Never>
    func observeCachedList(predicate: NSPredicate) -> AnyPublisher<[AccountDTO], Never>
}
