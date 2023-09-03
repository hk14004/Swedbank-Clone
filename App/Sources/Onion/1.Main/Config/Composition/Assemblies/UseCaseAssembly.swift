import Foundation
import Swinject
import DevToolsCore

class UseCaseAssembly: Assembly {
    func assemble(container: Container) {
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
        container.register(UserSessionManager.self) { resolver in
            UserSessionManager(
                credentialsStore: BaseUserSessionCredentialsStore<UserSessionCredentials>(),
                userSessionFactory: BaseUserSessionFactory<UserSessionCredentials>()
            )
        }
        container.register(IsAnyUserSessionActiveUseCase.self) { resolver in
            DefaultIsAnyUserSessionActiveUseCase(
                userSessionManager: resolver.resolve(UserSessionManager.self)!
            )
        }
    }
}
