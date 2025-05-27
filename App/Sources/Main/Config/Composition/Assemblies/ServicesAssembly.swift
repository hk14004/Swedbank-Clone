import Foundation
import Swinject
import DevToolsCore
import SwedApplicationBusinessRules
import SwedEnterpriseBusinessRules

class ServicesAssembly: Assembly {
    func assemble(container: Container) {
        container.register(StartSessionService.self) { resolver in
            MockStartSessionService()
        }
        .inObjectScope(.container)
        container.register(FetchRemoteCustomersService.self) { resolver in
            MockFetchCustomerService()
        }
        .inObjectScope(.container)
        container.register(FetchRemoteOffersService.self) { resolver in
            let service = MockFetchRemoteOffersService()
            service.mockResult = .just([Offer(id: "1", title: "hELLO", description: "This is description", date: Date())])
            return service
        }
        .inObjectScope(.container)
    }
}
