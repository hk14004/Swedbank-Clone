import Swinject
import SwedApplication
import DevToolsNavigation
import UIKit
import SwiftUI
import SwedOverview
import SwedLogin

class ScreenFactoryAssembly: Assembly {
    func assemble(container: Container) {
        container.register(UIWindow.self) { resolver in
            UIWindow(frame: UIScreen.main.bounds)
        }.inObjectScope(.container)
        // MARK: Splash
        container.register(SplashScreenFactory.self) { resolver in
            DefaultSplashScreenFactory()
        }
        // MARK: Login
        container.register((any LoginScreenFactory).self) { resolver in
            DefaultLoginScreenFactory(di: Dependencies(
                simpleLoginUseCase: Composition.resolve(),
                getCurrentCustomerUseCase: Composition.resolve(),
                pinAuthenticateUseCase: Composition.resolve(),
                getLastCustomerUseCase: Composition.resolve(),
                biometryAuthenticateUseCase: Composition.resolve())
            )
        }
        // MARK: Root tabbar
        container.register(RootTabbarScreenFactory.self) { resolver in
            DefaultRootTabbarScreenFactory()
        }
        // MARK: Dashboard
        container.register((any OverviewScreenFactory).self) { resolver in
            DefaultDashboardScreenFactory(
                di: Dependencies(
                    getRemoteOffersUseCase: Composition.resolve(),
                    trackCachedOffersUseCase: Composition.resolve(),
                    getRemoteAccountsUseCase: Composition.resolve(),
                    trackCachedAccountsUseCase: Composition.resolve(),
                    offerDetailsScreenFactory: Composition.resolve(),
                    logoutUseCase: Composition.resolve()
                )
            )
        }
        // MARK: Language selection
        container.register(LanguageSelectionScreenFactory.self) { resolver in
            DefaultLanguageSelectionScreenFactory()
        }
        container.register((any ProfileScreenFactory).self) { resolver in
            DefaultProfileScreenFactory(di: Dependencies(
                getRemoteOffersUseCase: Composition.resolve(),
                trackCachedOffersUseCase: Composition.resolve(),
                getRemoteAccountsUseCase: Composition.resolve(),
                trackCachedAccountsUseCase: Composition.resolve(),
                offerDetailsScreenFactory: Composition.resolve(),
                logoutUseCase: Composition.resolve()
            ))
        }
        container.register(ContactsScreenFactory.self) { resolver in
            DefaultContactsScreenFactory()
        }
        container.register((any OfferDetailsScreenFactory).self) { resolver in
            DefaultOfferDetailsScreenFactory()
        }
        container.register((any SimpleLoginScreenFactory).self) { resolver in
            DefaultSimpleLoginScreenFactory(di: Dependencies(
                simpleLoginUseCase: Composition.resolve(),
                getCurrentCustomerUseCase: Composition.resolve(),
                pinAuthenticateUseCase: Composition.resolve(),
                getLastCustomerUseCase: Composition.resolve(),
                biometryAuthenticateUseCase: Composition.resolve()
            )
            )
        }
    }
}
