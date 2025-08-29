//
//  ContactsScreenFactory.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 15/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import DevToolsNavigation
import UIKit

public protocol ContactsScreenFactory: UIKitScreenFactory where Params == ContactsScreenFactoryParams  {}

public struct ContactsScreenFactoryParams {
    public init() {}
}

public class DefaultContactsScreenFactory: ContactsScreenFactory {
    
    public init() {}
    
    public func make(params: ContactsScreenFactoryParams) -> UIViewController {
        let vm = DefaultContactsScreenVM()
        let vc = ContactsScreenVC(viewModel: vm)
        let router = DefaultContactsScreenRouter(viewController: vc)
        vm.router = router
        return vc
    }
}
