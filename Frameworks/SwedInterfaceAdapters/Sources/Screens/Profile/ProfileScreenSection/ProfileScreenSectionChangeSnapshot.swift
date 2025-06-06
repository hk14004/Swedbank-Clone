//
//  ProfileScreenSectionChangeSnapshot.swift
//  SwedInterfaceAdapters
//
//  Created by Hardijs Ķirsis on 30/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import DevToolsCore

public struct ProfileScreenSectionChangeSnapshot {
    public let sections: [ProfileScreenSection]
    public let changes: DevHashChangeSet
}
