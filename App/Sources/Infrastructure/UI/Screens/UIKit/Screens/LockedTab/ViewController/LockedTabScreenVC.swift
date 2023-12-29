//
//  LockedTabScreenVC.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 15/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import SwiftUI
import SwedInterfaceAdapters

class LockedTabScreenVC: UIHostingController<AnyView> {
    init(viewModel: some LockedDashboardVM) {
        super.init(rootView: AnyView(LockedTabScreenView(viewModel: viewModel)))
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
