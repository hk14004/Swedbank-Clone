//
//  DefaultContactsScreenRouter.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 25/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import SwiftUI
import UIKit
import Application
import DevToolsNavigation

class DefaultContactsScreenRouter: ContactsScreenRouter, UIKitRouter {
    weak var viewController: UIViewController?

    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension ToContactsScreenRouting where Self: UIKitRouter {
    func routeToContactsScreen() {
        let factory: ContactsScreenFactory = Composition.resolve()
        let vc = factory.make()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}

