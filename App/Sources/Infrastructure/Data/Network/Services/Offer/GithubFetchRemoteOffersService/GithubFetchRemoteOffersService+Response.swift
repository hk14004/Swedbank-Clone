//
//  GithubFetchRemoteOffersService+Response.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 28/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import Application

extension GithubFetchRemoteOffersService {
    typealias GithubOffersResponse = [GithubOffer]
    
    struct GithubOffer: Codable {
        let id: String?
        let title: String?
        let description: String?
        let date: String?
        
        // Optionaly handle missing data or provide defaults, throw error
        func mapToDomain() throws -> Offer {
            Offer(
                id: id ?? "Default ID",
                title: title ?? "Default title",
                description: description ?? "Default description",
                date: ISO8601DateFormatter().date(from: date ?? "") ?? Date()
            )
        }
    }
    
}
