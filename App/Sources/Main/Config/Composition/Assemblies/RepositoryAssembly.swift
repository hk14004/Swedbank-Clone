import Foundation
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
    }
}
