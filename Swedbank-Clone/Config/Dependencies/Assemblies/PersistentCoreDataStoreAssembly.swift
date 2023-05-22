//
//  PersistentCoreDataStoreAssembly.swift
//  CatalogViewer
//
//  Created by Hardijs Ķirsis on 11/05/2023.
//

import Swinject
import CoreData
import DevToolsCore
import DevToolsCoreData

class PersistentCoreDataStoreAssembly: Assembly {
    
    func assemble(container: Container) {
        
        // MARK: Core data stack
        
        container.register(NSPersistentContainer.self) { _ in
            lazy var persistentContainer: NSPersistentContainer = {
                let container = NSPersistentContainer(name: "Swedbank_Clone")
                container.loadPersistentStores(completionHandler: { (_, error) in
                    if let error = error as NSError? {
                        fatalError("Unresolved error \(error), \(error.userInfo)")
                    }
                })
                return container
            }()
            
            return persistentContainer
        }.inObjectScope(.container)
        
        // MARK: Entities
        
//        container.register(BasePersistedLayerInterface<Category>.self) { resolver in
//            PersistentCoreDataStore<Category>(storeContainer: resolver.resolve(NSPersistentContainer.self)!)
//        }.inObjectScope(.container)
//        
//        container.register(BasePersistedLayerInterface<Product>.self) { resolver in
//            PersistentCoreDataStore<Product>(storeContainer: resolver.resolve(NSPersistentContainer.self)!)
//        }.inObjectScope(.container)
//        
//        container.register(BasePersistedLayerInterface<ProductVariant>.self) { resolver in
//            PersistentCoreDataStore<ProductVariant>(storeContainer: resolver.resolve(NSPersistentContainer.self)!)
//        }.inObjectScope(.container)
    }
}
