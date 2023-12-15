//
//  RootTab.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 09/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

public enum RootTab {
    case overview
    case payments
    case cards
    case services
    case contacts
}

public struct PresentableRootTab {
    public let type: RootTab
    public let nameKey: String
    public let unselectedImageName: String
    public let selectedImageName: String
    public let locked: Bool
}
