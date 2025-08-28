//
//  OfferDetailsScreenFactory.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 30/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Combine
import UIKit
import SwedApplication
import DevToolsNavigation

public protocol OfferDetailsScreenFactory: UIKitScreenFactory where Params == Offer {}

public class DefaultOfferDetailsScreenFactory: OfferDetailsScreenFactory {
    
    public init() {}
    
    public func make(params: Offer) -> UIViewController {
        let vm = DefaultOfferDetailsScreenVM(offer: params)
        let vc = OfferDetailsScreenVC(viewModel: vm)
        return vc
    }
}
