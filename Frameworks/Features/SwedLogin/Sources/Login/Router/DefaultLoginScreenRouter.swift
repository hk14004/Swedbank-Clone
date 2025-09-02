//
//  DefaultLoginScreenRouter.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import Combine
import SwedApplication
import DevToolsNavigation
import SwedLocalization
import SwedUtils

class DefaultLoginScreenRouter: UIKitRouter, LoginScreenRouter {
    weak var viewController: UIViewController?
    let didLoginPublisher: PassthroughSubject<Void, Never>
    let didTapLangSelection: PassthroughSubject<Void, Never>
    
    init(
        viewController: UIViewController,
        didLoginPublisher: PassthroughSubject<Void, Never>,
        didTapLangSelection: PassthroughSubject<Void, Never>
    ) {
        self.viewController = viewController
        self.didLoginPublisher = didLoginPublisher
        self.didTapLangSelection = didTapLangSelection
    }
    
    func routeToLoginCompleted(customer: Customer) {
        didLoginPublisher.send()
    }
    
    func routeToLanguageSelectionScreen() {
        didTapLangSelection.send()
    }
}
