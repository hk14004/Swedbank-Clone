import Foundation
import DevToolsPersistance
import Swinject
import DevToolsCore
import SwedApplication
import SwedData
import SwedPersistance

class RepositoryAssembly: Assembly {
    func assemble(container: Container) {
        container.register(UserJourneyRepository.self) { resolver in
            DefaultUserJourneyRepository()
        }
        .inObjectScope(.container)
        container.register(ApplicationActivityRepository.self) { resolver in
            DefaultApplicationActivityRepository()
        }
        .inObjectScope(.container)
        container.register(UserSessionCredentialsRepository.self) { resolver in
            DefaultUserSessionCredentialsRepository(store: Composition.resolve())
        }
        .inObjectScope(.container)
        container.register(LanguageRepository.self) { resolver in
            DefaultLanguageRepository(
                appLocalization: Composition.resolve()
            )
        }
        .inObjectScope(.container)
        container.register(CustomerRepository.self) { resolver in
            DefaultCustomerRepository(
                fetchRemoteCustomersService: Composition.resolve(),
                localStore: resolver.resolve((any CustomerPersistedLayerInterface).self)!,
                currentCustomerStore: Composition.resolve()
            )
        }
        .inObjectScope(.container)
        container.register(OfferRepository.self) { resolver in
            DefaultOfferRepository(
                store: resolver.resolve((any OfferPersistedLayerInterface).self)!,
                fetchRemoteOffersService: Composition.resolve()
            )
        }
        .inObjectScope(.container)
        container.register(AccountRepository.self) { resolver in
            DefaultAccountRepository(
                store: resolver.resolve((any AccountPersistedLayerInterface).self)!,
                fetchRemoteAccountsService: Composition.resolve()
            )
        }
        .inObjectScope(.container)
    }
}

