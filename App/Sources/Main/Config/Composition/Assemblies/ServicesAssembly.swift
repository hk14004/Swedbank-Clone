import Foundation
import Swinject
import DevToolsCore
import Application
import Enterprise

class ServicesAssembly: Assembly {
    func assemble(container: Container) {
        container.register(StartSessionService.self) { resolver in
            DefaultStartSessionService(networkClient: Composition.resolve())
        }
        .inObjectScope(.container)
        container.register(FetchRemoteCustomersService.self) { resolver in
            GithubFetchRemoteCustomersService(networkClient: Composition.resolve())
        }
        .inObjectScope(.container)
        container.register(FetchRemoteOffersService.self) { resolver in
            GithubFetchRemoteOffersService(networkClient: Composition.resolve())
        }
        .inObjectScope(.container)
        container.register(FetchRemoteAccountsService.self) { resolver in
            GithubFetchRemoteAccountsService(networkClient: Composition.resolve())
        }
        .inObjectScope(.container)
    }
}
