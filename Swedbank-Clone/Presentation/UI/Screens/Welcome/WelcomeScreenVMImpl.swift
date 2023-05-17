//
//  WelcomeScreenVMImpl.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 17/05/2023.
//

import SwiftUI

class WelcomeScreenVMImpl {
     
    var navigationDelegate: WelcomeScreenVMNavigationDelegate?
    
}

// MARK: Public

extension WelcomeScreenVMImpl: WelcomeScreenVM {
    
    func onAlreadyCustomerTapped() {
        navigationDelegate?.onNavigationEvent(.alreadyCustomerTapped)
    }
    
    func onBecomeACustomerTapped() {
        navigationDelegate?.onNavigationEvent(.becomeCustomerTapped)
    }
}
