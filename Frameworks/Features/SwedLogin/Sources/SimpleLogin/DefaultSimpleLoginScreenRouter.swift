//
//  SimpleLoginScreenRouter.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 16/07/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import UIKit
import DevToolsNavigation
import SwedApplication
import Combine

class DefaultSimpleLoginScreenRouter: SimpleLoginScreenRouter, UIKitRouter {
    func routeToOkeyErrorAlert(_ error: any Error, onDismiss: (() -> Void)?) {
        
    }
    
    
    weak var viewController: UIViewController?
    private var onLoginCompletedEvent: PassthroughSubject<Void, Never>

    init(
        viewController: UIViewController,
        onLoginCompletedEvent: PassthroughSubject<Void, Never>
    ) {
        self.viewController = viewController
        self.onLoginCompletedEvent = onLoginCompletedEvent
    }
    
    func onLoginCompleted() {
        onLoginCompletedEvent.send(())
        onLoginCompletedEvent.send(completion: .finished)
    }
}
