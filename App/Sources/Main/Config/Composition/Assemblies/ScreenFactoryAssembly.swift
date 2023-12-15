import Swinject
import SwedApplicationBusinessRules
import SwedInterfaceAdapters
import DevToolsNavigation
import UIKit
import SwiftUI

class ScreenFactoryAssembly: Assembly {
    func assemble(container: Container) {
        // MARK: Splash
        container.register(SplashScreenFactory.self) { resolver in
            DefaultSplashScreenFactory()
        }
        // MARK: Login
        container.register(LoginScreenFactory.self) { resolver in
            DefaultLoginScreenFactory()
        }
        assableRootTabbarScreen(container: container)
        assableDashboard(container: container)
        assableLockedDashboardScreen(container: container)
    }
}

// MARK: - Dashboard
extension ScreenFactoryAssembly {
    func assableRootTabbarScreen(container: Container) {
        container.register(RootTabbarScreenVM.self) { resolver in
            DefaultRootTabbarScreenVM(isAnyUserSessionActiveUseCase: Composition.resolve())
        }
        container.register(RootTabbarScreenVC.self) { resolver in
            var vm = resolver.resolve(RootTabbarScreenVM.self)!
            let vc = RootTabbarScreenVC(viewModel: vm)
            let router = DefaultRootTabbarScreenRouter(viewController: vc)
            vm.router = router
            return vc
        }
    }
    
    func assableDashboard(container: Container) {
        container.register(DashboardScreenVM.self) { resolver in
            DefaultDashboardScreenVM()
        }
        container.register(DashboardScreenVC.self) { resolver in
            var vm = resolver.resolve(DashboardScreenVM.self)!
            let vc = DashboardScreenVC()
            return vc
        }
    }
}

// MARK: - Locked dashboard
extension ScreenFactoryAssembly {
    func assableLockedDashboardScreen(container: Container) {
        container.register(LockedTabScreenVC.self) { (resolver, config: LockedDashboardPresentationConfig) in
            let vm = DefaultLockedDashboardVM(presentation: config)
            let vc = LockedTabScreenVC(viewModel: vm)
            let router = DefaultLockedDashboardRouter(viewController: vc)
            vm.router = router
            return vc
        }
    }
}
