import Foundation
import Swinject
import DevToolsCore
import SwedApplicationBusinessRules

class UseCaseAssembly: Assembly {
    func assemble(container: Container) {
        container.register(LoginUseCase.self) { resolver in
            DefaultLoginUseCase(
                startSessionService: resolver.resolve(StartSessionService.self)!,
                manager: resolver.resolve(UserSessionManager.self)!,
                fetchCustomerService: resolver.resolve(FetchCustomerService.self)!,
                userSessionCredentialsRepository: resolver.resolve(UserSessionCredentialsRepository.self)!
            )
        }
        container.register(StartAllUserSessionsUseCase.self) { resolver in
            DefaultStartAllUserSessionsUseCase(
                manager: resolver.resolve(UserSessionManager.self)!
            )
        }
        container.register(isOnboardingCompletedUseCase.self) { resolver in
            DefaultIsOnboardingCompletedUseCase(
                userJourneyRepository: resolver.resolve(UserJourneyRepository.self)!
            )
        }
        container.register(SaveAppLaunchDateUseCase.self) { resolver in
            DefaultSaveAppLaunchDateUseCase(
                applicationActivityRepository: resolver.resolve(ApplicationActivityRepository.self)!
            )
        }
        container.register(SaveAppTerminationDateUseCase.self) { resolver in
            DefaultSaveAppTerminationDateUseCase(
                applicationActivityRepository: resolver.resolve(ApplicationActivityRepository.self)!
            )
        }
        container.register(IsAnyUserSessionActiveUseCase.self) { resolver in
            DefaultIsAnyUserSessionActiveUseCase(
                userSessionManager: resolver.resolve(UserSessionManager.self)!
            )
        }
        container.register(GetCurrentLanguageUseCase.self) { resolver in
            DefaultGetCurrentLanguageUseCase()
        }
        container.register(GetAvailableLanguagesUseCase.self) { resolver in
            DefaultGetAvailableLanguagesUseCase()
        }
        container.register(SetCurrentLanguagesUseCase.self) { resolver in
            DefaultSetCurrentLanguagesUseCase()
        }
    }
}
