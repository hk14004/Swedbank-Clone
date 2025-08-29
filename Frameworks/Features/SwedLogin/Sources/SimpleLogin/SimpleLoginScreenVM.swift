//
//  SimpleLoginScreenVM.swift
//  SwedInterfaceAdapters
//
//  Created by Hardijs Kirsis on 16/07/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Combine
import SwedApplication

protocol SimpleLoginScreenVM: ObservableObject {
    var username: String { get set }
    var password: String { get set }
    var isLoading: Bool { get }
    var router: SimpleLoginScreenRouter! { get set }
    
    func login()
}

class DefaultSimpleLoginScreenVM: SimpleLoginScreenVM {
    public var router: SimpleLoginScreenRouter!
    @Published public var username: String = ""
    @Published public var password: String = ""
    @Published public var isLoading: Bool = false
    private let simpleLoginUseCase: SimpleLoginUseCase
    private var cancelBag = Set<AnyCancellable>()
    
    init(simpleLoginUseCase: SimpleLoginUseCase) {
        self.simpleLoginUseCase = simpleLoginUseCase
    }
    
    func login() {
        isLoading = true
        simpleLoginUseCase.use(username: username, password: password)
            .receiveOnMainThread()
            .sink { [weak self] _ in
                self?.isLoading = false
                self?.router.routeToLoginCompleted()
            } completionError: { [weak self] error in
                self?.isLoading = false
                self?.router.routeToOkeyErrorAlert(error, onDismiss: nil)
            }
            .store(in: &cancelBag)
    }
}
