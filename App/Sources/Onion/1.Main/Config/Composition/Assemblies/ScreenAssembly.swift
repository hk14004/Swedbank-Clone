import Swinject

class ScreenAssembly: Assembly {
    func assemble(container: Container) {
        assembleSplashScreen(container: container)
    }
}

// MARK: - Splash
extension ScreenAssembly {
    func assembleSplashScreen(container: Container) {
        container.register(SplashVM.self) { resolver in
            DefaultSplashVM(
                isAnyUserSessionActiveUseCase: Composition.resolve()
            )
        }
        container.register(SplashVC.self) { resolver in
            var vm = resolver.resolve(SplashVM.self)!
            let vc = SplashVC(viewModel: vm)
            let router = DefaultSplashRouter(viewController: vc)
            vm.router = router
            return vc
        }
    }
}
