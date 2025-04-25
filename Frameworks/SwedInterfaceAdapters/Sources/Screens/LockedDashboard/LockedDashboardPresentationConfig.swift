//
//  LockedDashboardPresentation.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 09/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

public struct LockedDashboardPresentationConfig {
    public var title: String
    public var subtitle: String
    public var backgroundColorName: String
    public var tabDescriptionIconName: String
    
    public init(title: String, subtitle: String, backgroundColorName: String, tabDescriptionIconName: String) {
        self.title = title
        self.subtitle = subtitle
        self.backgroundColorName = backgroundColorName
        self.tabDescriptionIconName = tabDescriptionIconName
    }
}
