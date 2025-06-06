import Foundation
import Swinject
import DevToolsCore
import SwedApplicationBusinessRules
import KeychainAccess
import SwiftyUserDefaults
import CoreData
import DevToolsCoreData

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
        // MARK: Core data stack
        
        container.register(NSPersistentContainer.self) { resolver in
            lazy var persistentContainer: NSPersistentContainer = {
                /*
                 The persistent container for the application. This implementation
                 creates and returns a container, having loaded the store for the
                 application to it. This property is optional since there are legitimate
                 error conditions that could cause the creation of the store to fail.
                */
                let container = NSPersistentContainer(name: "CoreDataDB")
                container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                    if let error = error as NSError? {
                        // Replace this implementation with code to handle the error appropriately.
                        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                         
                        /*
                         Typical reasons for an error here include:
                         * The parent directory does not exist, cannot be created, or disallows writing.
                         * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                         * The device is out of space.
                         * The store could not be migrated to the current model version.
                         Check the error message to determine what the actual problem was.
                         */
                        fatalError("Unresolved error \(error), \(error.userInfo)")
                    }
                })
                return container
            }()
            
            return persistentContainer
        }
        .inObjectScope(.container)
        container.register(PersistentCoreDataStore<OfferDTO>.self) { resolver in
            PersistentCoreDataStore<OfferDTO>(storeContainer: Composition.resolve())
        }
        .inObjectScope(.container)
        container.register(PersistentCoreDataStore<CustomerDTO>.self) { resolver in
            PersistentCoreDataStore<CustomerDTO>(storeContainer: Composition.resolve())
        }
        .inObjectScope(.container)
    }
}
