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
protocol OverviewScreenRouter: ToErrorRouting, ToOfferDetailsRouting {
    func launchProfileIntent()
}

protocol ToOverviewScreenRouting {
    func routeToOverviewScreen(params: OverviewScreenFactoryParams)
}

protocol HasOverviewFactory {
    var overviewScreenFactory: any OverviewScreenFactory { get }
}

extension ToOverviewScreenRouting where Self: UIKitRouter & HasOverviewFactory {
    func routeToOverviewScreen(params: OverviewScreenFactoryParams) {
        let vc = overviewScreenFactory.make(params: params)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}

class DefaultOverviewScreenRouter: OverviewScreenRouter, UIKitRouter, HasOfferDetailsScreenFactory {
    var offerDetailsScreenFactory: any OfferDetailsScreenFactory
    
    func routeToOkeyErrorAlert(_ error: any Error, onDismiss: (() -> Void)?) {
        
    }

    weak var viewController: UIViewController?
    private let onLaunchProfileIntent: () -> Void
    
    init(
        viewController: UIViewController,
        offerDetailsScreenFactory: OfferDetailsScreenFactory,
        onLaunchProfileIntent: @escaping () -> Void
    ) {
        self.viewController = viewController
        self.onLaunchProfileIntent = onLaunchProfileIntent
        self.offerDetailsScreenFactory = offerDetailsScreenFactory
    }
    
    func launchProfileIntent() {
        onLaunchProfileIntent()
    }
}
