import Foundation
import Swinject
import DevToolsCore
import DevToolsNetworking
import SwedApplicationBusinessRules

class NetworkClientAssembly: Assembly {
    func assemble(container: Container) {
        container.register(NetworkReachability.self) { resolver in
            DefaultNetworkReachability()
        }
        .inObjectScope(.container)
        container.register(DevNetworkRequestFactory.self) { resolver in
            DefaultNetworkRequestFactory()
        }
        .inObjectScope(.container)
        container.register(DevNetworkDataProvider.self) { resolver in
            DefaultNetworkDataProvider()
        }
        .inObjectScope(.container)
        container.register(NetworkClientSessionExpiredPlugin.self) { resolver in
            DefaultNetworkClientSessionExpiredPlugin(logoutUseCase: Composition.resolve())
        }
        .inObjectScope(.container)
        container.register(SwedNetworkClient.self) { resolver in
            SwedNetworkClient(
                dataProvider: Composition.resolve(),
                requestFactory: Composition.resolve(),
                credentialStore: Composition.resolve(),
                reachabilityNotifier: Composition.resolve(),
                sessionExpiredPluginGetter: {
                    Composition.resolve()
                }
            )
        }
        .inObjectScope(.container)
    }
}
