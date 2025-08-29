//
//  ProfileScreenRouter.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 30/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import SwedApplication
import DevToolsNavigation
import UIKit
import Combine

class DefaultProfileScreenRouter: ProfileScreenRouter, UIKitRouter {
    func routeToLogoutPressed() {
        logoutFinished.send(())
        logoutFinished.send(completion: .finished)
    }
    
    weak var viewController: UIViewController?
    private let logoutFinished: PassthroughSubject<Void, Never>
    
    init(
        viewController: UIViewController,
        logoutFinished: PassthroughSubject<Void, Never>
    ) {
        self.viewController = viewController
        self.logoutFinished = logoutFinished
    }
}

extension ToProfileScreenRouting where Self: UIKitRouter {
    func routeToProfileScreen(params: ProfileScreenFactoryParams) {
        let vc = profileScreenFactory.make(params: params)
        let navVC = UINavigationController(rootViewController: vc)
        viewController?.present(navVC, animated: true)
    }
}
