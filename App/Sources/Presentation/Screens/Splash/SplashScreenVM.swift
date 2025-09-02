//
//  SplashVM.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/07/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine
import SwedApplication

public protocol SplashScreenVM: SplashVMInput, SplashVMOutput {}

public protocol SplashVMInput {
    func onViewDidLoad()
}

public protocol SplashVMOutput {
    var isLoadingPublisher: AnyPublisher<Bool, Never> { get }
    var router: SplashScreenRouter? { get set }
}

public class DefaultSplashVM: SplashScreenVM {
    // MARK: Properties
    public var router: SplashScreenRouter?
    public var isLoadingPublisher: AnyPublisher<Bool, Never> { $isLoading.eraseToAnyPublisher() }
    private let getLastCustomerUseCase: GetLastCustomerUseCase
    private let getCurrentCustomerUseCase: GetCurrentCustomerUseCase
    @Published private var isLoading: Bool = false
    private var cancelBag = Set<AnyCancellable>()
    
    // MARK: Lifecycle
    public init(
        getLastCustomerUseCase: GetLastCustomerUseCase,
        getCurrentCustomerUseCase: GetCurrentCustomerUseCase
    ) {
        self.getLastCustomerUseCase = getLastCustomerUseCase
        self.getCurrentCustomerUseCase = getCurrentCustomerUseCase
    }
}

// MARK: Input
public extension DefaultSplashVM {
    func onViewDidLoad() {
        guard let customer = getLastCustomerUseCase.use() else {
            router?.routeToSimpleLoginScreen(
                params: .init(loginCompleted: makeLoginCompletedPublisher())
            )
            return
        }
        router?.initRouteToRoot(customer: customer)
    }
}

// MARK: Private
public extension DefaultSplashVM {
    private func makeLoginCompletedPublisher() -> PassthroughSubject<Void, Never> {
        let publisher = PassthroughSubject<Void, Never>()
        publisher
            .receiveOnMainThread()
            .sink { [weak self] _ in
                guard
                    let self = self,
                    let customer = getCurrentCustomerUseCase.use()
                else {
                    return
                }
                router?.initRouteToRoot(customer: customer)
            }
            .store(in: &cancelBag)
        return publisher
    }
}
