import Foundation
import Swinject
import DevToolsCore
import DevToolsNetworking
import SwedApplication
import SwedNetwork

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
        container.register((any NetworkClientCredentialsPlugin).self) { resolver in
            DefaultNetworkClientCredentialsPlugin(credentialsStore: Composition.resolve())
        }
        .inObjectScope(.container)
        container.register(SwedNetworkClient.self) { resolver in
            SwedNetworkClient(
                dataProvider: Composition.resolve(),
                requestFactory: Composition.resolve(),
                reachabilityNotifier: Composition.resolve(),
                credentialsPlugin: { Composition.resolve() },
                sessionExpiredPlugin: { Composition.resolve() }
            )
        }
        .inObjectScope(.container)
    }
}
