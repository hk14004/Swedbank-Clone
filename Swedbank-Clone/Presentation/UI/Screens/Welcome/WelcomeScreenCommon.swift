//
//  WelcomeScreenCommon.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 17/05/2023.
//

import Combine

protocol WelcomeScreenVMNavigationDelegate: AnyObject {
    func onNavigationEvent(_ event: WelcomeScreenVMNavigationEvent)
}

enum WelcomeScreenVMNavigationEvent: CaseIterable {
    case alreadyCustomerTapped
    case becomeCustomerTapped
}

protocol WelcomeScreenVM: ObservableObject {
    var navigationDelegate: WelcomeScreenVMNavigationDelegate? { get set }
    func onAlreadyCustomerTapped()
    func onBecomeACustomerTapped()
}
