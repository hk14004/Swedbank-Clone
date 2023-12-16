import Foundation
import Swinject
import DevToolsCore
import SwedApplicationBusinessRules

class UseCaseAssembly: Assembly {
    func assemble(container: Container) {
        container.register(LoginUseCase.self) { resolver in
            DefaultLoginUseCase(
                startSessionService: Composition.resolve(),
                manager: Composition.resolve(),
                fetchCustomerService: Composition.resolve(),
                userSessionCredentialsRepository: Composition.resolve()
            )
        }
        container.register(StartAllUserSessionsUseCase.self) { resolver in
            DefaultStartAllUserSessionsUseCase(
                manager: Composition.resolve()
            )
        }
        container.register(isOnboardingCompletedUseCase.self) { resolver in
            DefaultIsOnboardingCompletedUseCase(
                userJourneyRepository: Composition.resolve()
            )
        }
        container.register(SaveAppLaunchDateUseCase.self) { resolver in
            DefaultSaveAppLaunchDateUseCase(
                applicationActivityRepository: Composition.resolve()
            )
        }
        container.register(SaveAppTerminationDateUseCase.self) { resolver in
            DefaultSaveAppTerminationDateUseCase(
                applicationActivityRepository: Composition.resolve()
            )
        }
        container.register(IsAnyUserSessionActiveUseCase.self) { resolver in
            DefaultIsAnyUserSessionActiveUseCase(
                userSessionManager: resolver.resolve(UserSessionManager.self)!
            )
        }
        container.register(GetCurrentLanguageUseCase.self) { resolver in
            DefaultGetCurrentLanguageUseCase(languageRepository: Composition.resolve())
        }
        container.register(GetAvailableLanguagesUseCase.self) { resolver in
            DefaultGetAvailableLanguagesUseCase(languageRepository: Composition.resolve())
        }
        container.register(SetCurrentLanguagesUseCase.self) { resolver in
            DefaultSetCurrentLanguagesUseCase(languageRepository: Composition.resolve())
        }
    }
}
