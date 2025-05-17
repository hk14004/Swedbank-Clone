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
import SwedApplicationBusinessRules
import DevToolsNavigation

class DefaultLoginScreenRouter: UIKitRouter, LoginScreenRouter, CancelBagStorable {
    var cancelBag = Set<AnyCancellable>()
    var viewController: UIViewController
    let didLoginPublisher: PassthroughSubject<CustomerDTO, Never>
    
    init(
        viewController: UIViewController,
        didLoginPublisher: PassthroughSubject<CustomerDTO, Never>
    ) {
        self.viewController = viewController
        self.didLoginPublisher = didLoginPublisher
    }
    
    func routeToLoginCompleted(customer: CustomerDTO) {
        didLoginPublisher.send(customer)
    }
}
