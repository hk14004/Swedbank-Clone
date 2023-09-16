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
                dataProvider: resolver.resolve(DevNetworkDataProvider.self)!,
                requestFactory: resolver.resolve(DevNetworkRequestFactory.self)!
            )
        }
        .inObjectScope(.container)
    }
}
