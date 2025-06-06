import Foundation
import DevToolsCoreData
import Swinject
import DevToolsCore
import SwedApplicationBusinessRules

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
            DefaultCustomerRepository()
        }
        .inObjectScope(.container)
        container.register(OfferRepository.self) { resolver in
            DefaultOfferRepository(
                store: resolver.resolve(PersistentCoreDataStore<OfferDTO>.self)!,
                fetchRemoteOffersService: Composition.resolve()
            )
        }
        .inObjectScope(.container)
    }
}
