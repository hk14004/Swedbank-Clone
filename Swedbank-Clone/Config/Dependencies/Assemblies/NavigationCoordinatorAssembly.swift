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
        
        container.register(AuthorizationFlowCoordinator.self.self) { (resolver, navigationController: UINavigationController) in
            return AuthorizationFlowCoordinator(navigationController: navigationController)
        }
        container.register(TabBarCoordinator.self.self) { (resolver, navigationController: UINavigationController) in
            return TabBarCoordinator(navigationController: navigationController)
        }.inObjectScope(.container)
        
        container.register(OverviewFlowCoordinator.self.self) { (resolver, navigationController: UINavigationController) in
            return OverviewFlowCoordinator(navigationController: navigationController)
        }
        
        container.register(PaymentsFlowCoordinator.self.self) { (resolver, navigationController: UINavigationController) in
            return PaymentsFlowCoordinator(navigationController: navigationController)
        }
        
        container.register(UserScreenCoordinator.self) { (resolver, navigationController: UINavigationController) in
            return UserScreenCoordinator(navigationController: navigationController)
        }
        
        container.register(SettingsScreenCoordinator.self) { (resolver, navigationController: UINavigationController) in
            return SettingsScreenCoordinator(navigationController: navigationController)
        }
    }
    
}
