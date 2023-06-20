//
//  NavigationCoordinatorAssembly.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 11/06/2023.
//

import Foundation
import Swinject
import DevToolsNavigation
import UIKit

class NavigationCoordinatorAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(UIWindow.self.self) { _ in
            let sceneDelegate = UIApplication.shared.connectedScenes.first!.delegate as! SceneDelegate
            return sceneDelegate.window!
        }
        container.register(AppCoordinator.self.self) { resolver in
            return AppCoordinator(window: resolver.resolve(UIWindow.self)!)
        }.inObjectScope(.container)
        
        container.register(AuthorisationCoordinator.self.self) { (resolver, router: RouterProtocol) in
            return AuthorisationCoordinator(router: router)
        }
        container.register(TabBarCoordinator.self.self) { (resolver, router: RouterProtocol) in
            return TabBarCoordinator(router: router)
        }.inObjectScope(.container)
        
        container.register(OverviewCoordinator.self.self) { (resolver, router: RouterProtocol) in
            return OverviewCoordinator(router: router)
        }
        
        container.register(PaymentsCoordinator.self.self) { (resolver, router: RouterProtocol) in
            return PaymentsCoordinator(router: router)
        }
        
        container.register(UserCoordinator.self) { (resolver, router: RouterProtocol) in
            return UserCoordinator(router: router)
        }
        
        container.register(SettingsCoordinator.self) { (resolver, router: RouterProtocol) in
            return SettingsCoordinator(router: router)
        }
    }
    
}
