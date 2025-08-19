//
//  SimpleLoginScreenVC.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 16/07/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import SwiftUI

class SimpleLoginScreenVC: UIHostingController<AnyView> {
    init(viewModel: some SimpleLoginScreenVM) {
        super.init(rootView: AnyView(SimpleLoginScreenView(viewModel: viewModel)))
        title = "AppStrings.Screen.OfferDetails.title"
        navigationItem.largeTitleDisplayMode = .never
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
