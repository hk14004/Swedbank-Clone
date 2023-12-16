//
//  DefaultLoginRouter.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import SwedInterfaceAdapters
import Combine

class DefaultLoginScreenRouter: LoginScreenRouter {

    var viewController: UIViewController
    let didLoginPublisher: PassthroughSubject<Void, Never>

    init(
        viewController:UIViewController,
        didLoginPublisher: PassthroughSubject<Void, Never>
    ) {
        self.viewController = viewController
        self.didLoginPublisher = didLoginPublisher
    }
    
    func routeToLoginCompleted() {
        didLoginPublisher.send()
    }
}
