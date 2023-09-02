import Swinject

class ScreenAssembly: Assembly {
    func assemble(container: Container) {
        container.register((any SplashScreenFactory).self) { resolver in
            DefaultSplashScreenFactory()
        }
        .inObjectScope(.container)
    }
}
