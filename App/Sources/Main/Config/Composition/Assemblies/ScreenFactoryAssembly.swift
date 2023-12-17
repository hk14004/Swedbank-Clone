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
        // MARK: Root tabbar
        container.register(RootTabbarScreenFactory.self) { resolver in
            DefaultRootTabbarScreenFactory()
        }
        // MARK: Dashboard
        container.register(OverviewScreenFactory.self) { resolver in
            DefaultDashboardScreenFactory()
        }
        // MARK: Locked dashboard
        container.register(LockedTabScreenFactory.self) { resolver in
            DefaultLockedTabScreenFactory()
        }
        // MARK: Language selection
        container.register(LanguageSelectionScreenFactory.self) { resolver in
            DefaultLanguageSelectionScreenFactory()
        }
    }
}
