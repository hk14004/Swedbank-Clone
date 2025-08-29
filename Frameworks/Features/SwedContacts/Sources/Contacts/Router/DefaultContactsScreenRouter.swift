//
//  DefaultContactsScreenRouter.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 25/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import SwiftUI
import UIKit
import SwedApplication
import DevToolsNavigation

class DefaultContactsScreenRouter: ContactsScreenRouter, UIKitRouter {
    weak var viewController: UIViewController?

    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}
