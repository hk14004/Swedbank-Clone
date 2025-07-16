import Foundation
import Swinject
import DevToolsCore
import SwedApplicationBusinessRules

class UseCaseAssembly: Assembly {
    func assemble(container: Container) {
        container.register(FakeAlreadyLoggedInUseCase.self) { resolver in
            DefaultFakeAlreadyLoggedInUseCase(
                customerRepository: Composition.resolve(),
                startSessionService: Composition.resolve(),
                userSessionCredentialsRepository: Composition.resolve()
            )
        }
        container.register(GetLastCustomerUseCase.self) { resolver in
            MockGetLastCustomerUseCase(customerRepository: Composition.resolve())
        }
        container.register(PinAuthenticateUseCase.self) { resolver in
            DefaultPinAuthenticateUseCase()
        }
        container.register(BiometryAuthenticateUseCase.self) { resolver in
            DefaultBiometryAuthenticateUseCase()
        }
        container.register(StartUserSessionUseCase.self) { resolver in
            DefaultStartUserSessionUseCase(
                customerRepository: Composition.resolve()
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
                customerRepository: Composition.resolve()
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
                customerRepository: Composition.resolve()
            )
        }
        container.register(NukeCustomerPersistedDataUseCase.self) { resolver in
            DefaultNukeCustomerPersistedDataUseCase(
                customerRepository: Composition.resolve(),
                offerRepository: Composition.resolve(),
                accountRepository: Composition.resolve(),
                userSessionCredentialsRepository: Composition.resolve()
            )
        }
        container.register(LogoutUseCase.self) { resolver in
            DefaultLogoutUseCase(
                customerRepository: Composition.resolve(),
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
        container.register(GetRemoteAccountsUseCase.self) { resolver in
            DefaultGetRemoteAccountsUseCase(accountRepository: Composition.resolve())
        }
        container.register(TrackCachedAccountsUseCase.self) { resolver in
            DefaultTrackCachedAccountsUseCase(accountRepository: Composition.resolve())
        }
    }
}
