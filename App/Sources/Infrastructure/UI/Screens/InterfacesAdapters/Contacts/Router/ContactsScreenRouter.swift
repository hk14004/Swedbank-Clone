//
//  ContactsScreenRouter.swift
//  SwedInterfaceAdapters
//
//  Created by Hardijs Ķirsis on 25/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import Application

public protocol ContactsScreenRouter: ToContactsScreenRouting {}

public protocol ToContactsScreenRouting {
    func routeToContactsScreen()
}
