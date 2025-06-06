import Foundation
import Swinject
import DevToolsCore
import SwedApplicationBusinessRules

class UseCaseAssembly: Assembly {
    func assemble(container: Container) {
        container.register(GetLastCustomerUseCase.self) { resolver in
            MockGetLastCustomerUseCase()
        }
        container.register(LoginUseCase.self) { resolver in
            DefaultLoginUseCase(
                startSessionService: Composition.resolve(),
                manager: Composition.resolve(),
                userSessionCredentialsRepository: Composition.resolve(), 
                customerRepository: Composition.resolve()
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
                userSessionManager: Composition.resolve()
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
        container.register(GetCurrentCustomerUseCase.self) { resolver in
            DefaultGetCurrentCustomerUseCase(
                userSessionManager: Composition.resolve(),
                customerRepository: Composition.resolve()
            )
        }
        container.register(NukeCustomerPersistedDataUseCase.self) { resolver in
            DefaultNukeCustomerPersistedDataUseCase(
                customerRepository: Composition.resolve(),
                offerRepository: Composition.resolve()
            )
        }
        container.register(LogoutUseCase.self) { resolver in
            DefaultLogoutUseCase(
                manager: Composition.resolve(),
                nukeCustomerPersistedDataUseCase: Composition.resolve()
            )
        }
        container.register(GetRemoteOffersUseCase.self) { resolver in
            DefaultLoadLatestOffersUseCase(
                offerRepository: Composition.resolve()
            )
        }
        container.register(TrackCachedOffersUseCase.self) { resolver in
            DefaultTrackCachedOffersUseCase(
                offerRepository: Composition.resolve()
            )
        }
    }
}
