import Foundation
import Swinject
import DevToolsCore
import SwedApplicationBusinessRules
import SwedEnterpriseBusinessRules

class ServicesAssembly: Assembly {
    func assemble(container: Container) {
        container.register(StartSessionService.self) { resolver in
            MockStartSessionService()
        }
        .inObjectScope(.container)
        container.register(FetchRemoteCustomersService.self) { resolver in
            MockFetchCustomerService()
        }
        .inObjectScope(.container)
        container.register(FetchRemoteOffersService.self) { resolver in
            GithubFetchRemoteOffersService(networkClient: Composition.resolve())
        }
        .inObjectScope(.container)
    }
}
