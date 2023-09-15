import Swinject
import SwedApplicationBusinessRules

class ScreenAssembly: Assembly {
    func assemble(container: Container) {
        assembleSplashScreen(container: container)
        assambleLoginScreen(container: container)
        assableDashboardScreen(container: container)
        assableLockedDashboardScreen(container: container)
    }
}

// MARK: - Splash
extension ScreenAssembly {
    func assembleSplashScreen(container: Container) {
        container.register(SplashScreenVM.self) { resolver in
            DefaultSplashVM(
                isAnyUserSessionActiveUseCase: Composition.resolve(),
                getCompletedOnboardingUseCase: Composition.resolve(),
                startAllUserSessionsUseCase: Composition.resolve()
            )
        }
        container.register(SplashScreenVC.self) { resolver in
            var vm = resolver.resolve(SplashScreenVM.self)!
            let vc = SplashScreenVC(viewModel: vm)
            let router = DefaultSplashScreenRouter(viewController: vc)
            vm.router = router
            return vc
        }
    }
}

// MARK: - Login
extension ScreenAssembly {
    func assambleLoginScreen(container: Container) {
        container.register(LoginScreenVM.self) { resolver in
            DefaultLoginScreenVM(loginUseCase: resolver.resolve(LoginUseCase.self)!)
        }
        container.register(LoginScreenVC.self) { resolver in
            var vm = resolver.resolve(LoginScreenVM.self)!
            let vc = LoginScreenVC(viewModel: vm)
            let router = DefaultLoginScreenRouter(viewController: vc)
            vm.router = router
            return vc
        }
    }
}

// MARK: - Dashboard
extension ScreenAssembly {
    func assableDashboardScreen(container: Container) {
        container.register(DashboardScreenVM.self) { resolver in
            DefaultDashboardScreenVM()
        }
        container.register(DashboardScreenVC.self) { resolver in
            var vm = resolver.resolve(DashboardScreenVM.self)!
            let vc = DashboardScreenVC(viewModel: vm)
            let router = DefaultDashboardScreenRouter(viewController: vc)
            vm.router = router
            return vc
        }
    }
}

// MARK: - Locked dashboard
extension ScreenAssembly {
    func assableLockedDashboardScreen(container: Container) {
        container.register(LockedDashboardVC.self) { (resolver, config: LockedDashboardPresentationConfig) in
            var vm = DefaultLockedDashboardVM(presentation: config)
            let vc = LockedDashboardVC(viewModel: vm)
            let router = DefaultLockedDashboardRouter(viewController: vc)
            vm.router = router
            return vc
        }
    }
}
