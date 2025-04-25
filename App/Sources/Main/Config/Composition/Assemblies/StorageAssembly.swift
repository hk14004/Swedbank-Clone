import Foundation
import Swinject
import DevToolsCore
import SwedApplicationBusinessRules
import KeychainAccess
import SwiftyUserDefaults

class StorageAssembly: Assembly {
    func assemble(container: Container) {
        container.register(DefaultsAdapter<DefaultsKeys>.self) { resolver in
            DefaultsAdapter<DefaultsKeys>(defaults: UserDefaults.standard, keyStore: .init())
        }.inObjectScope(.container)
        container.register(Keychain.self) { resolver in
            Keychain(service: "com.app.key") // TODO: Move to constants
        }
        .inObjectScope(.container)
        container.register(BaseUserSessionCredentialsStore<UserSessionCredentials>.self) { resolver in
            DefaultUserSessionCredentialsStore(keychain: Composition.resolve())
        }
        .inObjectScope(.container)
        
    }
}
