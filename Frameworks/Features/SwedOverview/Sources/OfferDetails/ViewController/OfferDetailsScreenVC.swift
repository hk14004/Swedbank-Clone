//
//  OfferDetailsScreenVC.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 27/05/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import SwiftUI

public class OfferDetailsScreenVC: UIHostingController<AnyView> {
    init(viewModel: some OfferDetailsScreenVM) {
        super.init(rootView: AnyView(OfferDetailsScreenView(viewModel: viewModel)))
        title = AppStrings.Screen.OfferDetails.title
        navigationItem.largeTitleDisplayMode = .never
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
