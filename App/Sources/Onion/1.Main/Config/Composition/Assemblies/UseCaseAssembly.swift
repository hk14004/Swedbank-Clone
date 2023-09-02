import Foundation
import Swinject
import DevToolsCore

class UseCaseAssembly: Assembly {
    func assemble(container: Container) {
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
