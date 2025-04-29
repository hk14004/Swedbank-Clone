//
//  CustomerDTO.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Ķirsis on 30/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

public struct CustomerDTO {
    public let id: String
    public let displayName: String
    
    public init(id: String, displayName: String) {
        self.id = id
        self.displayName = displayName
    }
}

public extension CustomerDTO {
    func getInitials() -> String {
        let words = displayName.split(separator: " ")
        return words.map { $0.first?.uppercased() ?? "" }.joined()
    }
}
