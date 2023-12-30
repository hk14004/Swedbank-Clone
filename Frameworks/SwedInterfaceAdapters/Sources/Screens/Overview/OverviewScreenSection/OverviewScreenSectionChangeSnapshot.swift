//
//  OverviewScreenSectionChangeSnapshot.swift
//  SwedInterfaceAdapters
//
//  Created by Hardijs Ķirsis on 30/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import DevToolsCore

public struct OverviewScreenSectionChangeSnapshot {
    public let sections: [OverviewScreenSection]
    public let changes: DevHashChangeSet
}
