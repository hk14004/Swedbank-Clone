import Foundation
import Swinject
import DevToolsCore
import Application
import KeychainAccess
import SwiftyUserDefaults
import SwiftData
import DevToolsPersistance

class StorageAssembly: Assembly {
    func assemble(container: Container) {
        container.register(DefaultsAdapter<DefaultsKeys>.self) { resolver in
            DefaultsAdapter<DefaultsKeys>(defaults: UserDefaults.standard, keyStore: .init())
        }.inObjectScope(.container)
        container.register(Keychain.self) { resolver in
            Keychain(service: "com.app.key") // TODO: Move to constants
        }
        .inObjectScope(.container)
        container.register((any SwedUserSessionCredentialsStore).self) { resolver in
            DefaultUserSessionCredentialsStore(keychain: Composition.resolve())
        }
        .inObjectScope(.container)
        container.register(CurrentCustomerStore.self) { resolver in
            DefaultCurrentCustomerStore()
        }
        .inObjectScope(.container)
        // MARK: Swift data stack
        container.register(ModelContainer.self) { resolver in
            lazy var container: ModelContainer = {
                let schema = Schema([
                  CustomerSD.self,
                  AccountSD.self,
                  OfferSD.self
                ])

                let config = ModelConfiguration(
                  schema: schema,
                  isStoredInMemoryOnly: false
                )

                do {
                  return try ModelContainer(
                    for: schema,
                    configurations: [config]
                  )
                } catch {
                  fatalError("Could not create ModelContainer: \(error)")
                }
              }()
            return container
        }

        container.register((any OfferPersistedLayerInterface).self) { resolver in
            let container: ModelContainer = Composition.resolve()
            return DevSwiftDataStore<Offer, OfferConverter>(container: container, converter: OfferConverter(), queue: .main)
        }
        .inObjectScope(.container)
        container.register((any CustomerPersistedLayerInterface).self) { resolver in
            let container: ModelContainer = Composition.resolve()
            return DevSwiftDataStore<Customer, CustomerConverter>(container: container, converter: CustomerConverter(), queue: .main)
        }
        .inObjectScope(.container)
        container.register((any AccountPersistedLayerInterface).self) { resolver in
            let container: ModelContainer = Composition.resolve()
            return DevSwiftDataStore<Account, AccountConverter>(container: container, converter: AccountConverter(), queue: .main)
        }
        .inObjectScope(.container)
    }
}

protocol AccountPersistedLayerInterface: DevSwiftDataInterface where DTO == Account {}
protocol OfferPersistedLayerInterface: DevSwiftDataInterface where DTO == Offer {}
protocol CustomerPersistedLayerInterface: DevSwiftDataInterface where DTO == Customer {}

extension DevSwiftDataStore: CustomerPersistedLayerInterface where DTO == Customer {}
extension DevSwiftDataStore: OfferPersistedLayerInterface where DTO == Offer {}
extension DevSwiftDataStore: AccountPersistedLayerInterface where DTO == Account {}
