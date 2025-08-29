//
//  LanguageSelectionVC.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 16/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import SwiftUI

class LanguageSelectionVC: UIHostingController<AnyView> {
    init(viewModel: some LanguageSelectionScreenVM) {
        super.init(rootView: AnyView(LanguageSelectionScreenView(viewModel: viewModel)))
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
