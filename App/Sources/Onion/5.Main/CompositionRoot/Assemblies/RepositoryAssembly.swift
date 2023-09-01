import Foundation
import Swinject
import DevToolsCore

class RepositoryAssembly: Assembly {
    
    func assemble(container: Container) {
        
//        container.register(CategoryRepository.self) { resolver in
//            CategoryRepositoryImpl(remoteProvider: resolver.resolve(CatalogProvider.self)!,
//                                   categoriesStore:  resolver.resolve(BasePersistedLayerInterface<Category>.self)!,
//                                   mapper: resolver.resolve(CategoryResponseMapper.self)!)
//        }.inObjectScope(.container)
//
//        container.register(ProductRepository.self) { resolver in
//            ProductRepositoryImpl(remoteProvider: resolver.resolve(CatalogProvider.self)!,
//                                  productsStore: resolver.resolve(BasePersistedLayerInterface<Product>.self)!,
//                                  mapper: resolver.resolve(ProductResponseMapper.self)!,
// productVariantStore: resolver.resolve(BasePersistedLayerInterface<ProductVariant>.self)!)
//        }.inObjectScope(.container)
    }
}
