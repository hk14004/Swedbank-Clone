//
//  OfferDetailsScreenView.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 27/05/2023.
//

import SwiftUI
import DevToolsUI

struct OfferDetailsScreenView<ViewModel: OfferDetailsScreenVM>: View {
    
    @ObservedObject var viewModel: ViewModel
    @ObservedObject var loc = AppLocalizationObserver()
    
    var body: some View {
        VStack {
            Text(viewModel.title)
            Text(viewModel.description)
        }
        .padding(UIConstant.View.defaultPadding)
        .background(AppColors.background2.swiftUIColor)
        .cornerRadius(UIConstant.View.cornerRadius)
    }
}

#Preview {
    AppLocalizedPreview(language: "en")
    OfferDetailsScreenView(viewModel: OfferDetailsScreenVMPreview())
}

private class OfferDetailsScreenVMPreview: OfferDetailsScreenVM {
    var title: String { "Attention!" }
    var description: String { "This is one special offer" }
}
