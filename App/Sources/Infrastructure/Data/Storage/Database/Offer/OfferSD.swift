//
//  OfferSD.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 1/05/2025.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//
import Foundation
import SwiftData
import DevToolsPersistance

@Model
public class OfferSD {
    @Attribute(.unique) public var id: String
    public var title: String
    public var desc: String
    public var date: Date
    
    public init(id: String, title: String, desc: String, date: Date) {
        self.id = id
        self.title = title
        self.desc = desc
        self.date = date
    }
}

extension OfferSD: DevDBStoredObject {}
