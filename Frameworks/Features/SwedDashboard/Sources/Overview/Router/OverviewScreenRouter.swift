//
//  OverviewScreenRouter.swift
//  SwedInterfaceAdapters
//
//  Created by Hardijs Ķirsis on 25/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import UIKit
import SwedApplication
import DevToolsNavigation

//public protocol OverviewScreenRouter: ToProfileScreenRouting, ToOfferDetailsRouting, ToErrorRouting, ToSimpleLoginScreenRouting {}
public protocol OverviewScreenRouter: ToErrorRouting {
    func launchProfileIntent()
}

public protocol ToOverviewScreenRouting {
    func routeToOverviewScreen(customer: Customer)
}

public protocol HasOverviewFactory {
    var overviewScreenFactory: OverviewScreenFactory { get }
}

public extension ToOverviewScreenRouting where Self: UIKitRouter & HasOverviewFactory {
    func routeToOverviewScreen(
        customer: Customer,
        onLaunchProfileIntent: @escaping () -> Void
    ) {
        let vc = overviewScreenFactory.make(
            customer: customer,
            onLaunchProfileIntent: onLaunchProfileIntent
        )
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}

class DefaultOverviewScreenRouter: OverviewScreenRouter, UIKitRouter {
    func routeToOkeyErrorAlert(_ error: any Error, onDismiss: (() -> Void)?) {
        
    }
    
    func routeToOfferDetails(offer: Offer) {
        
    }
    
    weak var viewController: UIViewController?
    private let onLaunchProfileIntent: () -> Void
    
    init(
        viewController: UIViewController,
        onLaunchProfileIntent: @escaping () -> Void
    ) {
        self.viewController = viewController
        self.onLaunchProfileIntent = onLaunchProfileIntent
    }
    
    func launchProfileIntent() {
        onLaunchProfileIntent()
    }
}
