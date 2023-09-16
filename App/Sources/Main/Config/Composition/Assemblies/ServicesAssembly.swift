import Foundation
import Swinject
import DevToolsCore
import SwedApplicationBusinessRules

class ServicesAssembly: Assembly {
    func assemble(container: Container) {
        container.register(LoginService.self) { resolver in
            MockLoginService(networkClient: container.resolve(SwedNetworkClient.self)!)
        }
        .inObjectScope(.container)
        container.register(FetchCustomerService.self) { resolver in
            MockFetchCustomerService(networkClient: container.resolve(SwedNetworkClient.self)!)
        }
        .inObjectScope(.container)
    }
}
