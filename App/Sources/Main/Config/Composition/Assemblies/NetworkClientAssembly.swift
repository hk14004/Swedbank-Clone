import Foundation
import Swinject
import DevToolsCore
import DevToolsNetworking
import SwedApplicationBusinessRules

class NetworkClientAssembly: Assembly {
    func assemble(container: Container) {
        container.register(DevNetworkRequestFactory.self) { resolver in
            DefaultNetworkRequestFactory()
        }
        .inObjectScope(.container)
        container.register(DevNetworkDataProvider.self) { resolver in
            DefaultNetworkDataProvider()
        }
        .inObjectScope(.container)
        container.register(SwedNetworkClient.self) { resolver in
            SwedNetworkClient(
                dataProvider: Composition.resolve(),
                requestFactory: Composition.resolve(),
                credentialStore: Composition.resolve(),
                currentCustomerStore: Composition.resolve()
            )
        }
        .inObjectScope(.container)
    }
}
