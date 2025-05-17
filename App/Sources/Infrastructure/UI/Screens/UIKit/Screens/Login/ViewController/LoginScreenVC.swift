//
//  LoginScreenVC.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import SwiftUI
import SwedInterfaceAdapters

class LoginScreenVC: UIHostingController<AnyView> {
    init(viewModel: some LoginScreenVM) {
        super.init(rootView: AnyView(LoginScreenView(viewModel: viewModel)))
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
