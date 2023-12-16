//
//  LockedDashboardRouter.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 09/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import SwedInterfaceAdapters
import DevToolsNavigation
import Combine

class DefaultLockedDashboardRouter: LockedDashboardRouter, UIKitRouter {
    
    var viewController: UIViewController
    private var cancelBag = Set<AnyCancellable>()
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func routeToLanguageChange() {
        let factory: LanguageSelectionScreenFactory = Composition.resolve()
        let didSelectLanguageCodePublisher = PassthroughSubject<String, Never>()
        let vc = factory.make(
            didSelectLanguageCodePublisher: didSelectLanguageCodePublisher
        )
        didSelectLanguageCodePublisher.sink { _ in
            vc.dismiss(animated: true)
        }
        .store(in: &cancelBag)
        viewController.present(vc, animated: true)
    }
    
    func routeToLogin() {
        let factory: LoginScreenFactory = Composition.resolve()
        let didLoginPublisher = PassthroughSubject<Void, Never>()
        let vc = factory.make(didLoginPublisher: didLoginPublisher)
        didLoginPublisher.sink { _ in
            vc.dismiss(animated: true)
        }
        .store(in: &cancelBag)
        viewController.present(vc, animated: true)
    }
}
