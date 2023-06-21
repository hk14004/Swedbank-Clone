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
        
        container.register(AuthorisationCoordinator.self.self) { (resolver, navigationController: UINavigationController) in
            return AuthorisationCoordinator(navigationController: navigationController)
        }
        container.register(TabBarCoordinator.self.self) { (resolver, navigationController: UINavigationController) in
            return TabBarCoordinator(navigationController: navigationController)
        }.inObjectScope(.container)
        
        container.register(OverviewCoordinator.self.self) { (resolver, navigationController: UINavigationController) in
            return OverviewCoordinator(navigationController: navigationController)
        }
        
        container.register(PaymentsCoordinator.self.self) { (resolver, navigationController: UINavigationController) in
            return PaymentsCoordinator(navigationController: navigationController)
        }
        
        container.register(UserCoordinator.self) { (resolver, navigationController: UINavigationController) in
            return UserCoordinator(navigationController: navigationController)
        }
        
        container.register(SettingsScreenCoordinator.self) { (resolver, navigationController: UINavigationController) in
            return SettingsScreenCoordinator(navigationController: navigationController)
        }
    }
    
}
