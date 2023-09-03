import Swinject

class ScreenAssembly: Assembly {
    func assemble(container: Container) {
        assembleSplashScreen(container: container)
        assambleLoginScreen(container: container)
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
           DefaultLoginScreenVM()
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
