//
//  WelcomeScreenPreview.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 17/05/2023.
//

import SwiftUI

struct WelcomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreenView(viewModel: WelcomeScreenVMPreview())
    }
}

fileprivate class WelcomeScreenVMPreview: WelcomeScreenVM {
    
    var navigationDelegate: WelcomeScreenVMNavigationDelegate?
    
    func onAlreadyCustomerTapped() {
        
    }
    
    func onBecomeACustomerTapped() {
        
    }
}
