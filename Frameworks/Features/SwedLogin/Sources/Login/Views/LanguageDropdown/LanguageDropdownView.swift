//
//  LanguageDropdownView.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 28/05/2023.
//

import SwiftUI
import DevToolsUI
import SwedDesignSystem

struct LanguageDropdownView: View {
    
    @ObservedObject var loc: AppLocalizationObserver = AppLocalizationObserver()
    
    var body: some View {
        VStack {
            HStack {
                makeFlagImageView()
                Image(systemName: "chevron.down")
                    .foregroundStyle(
                        Color(asset: AppColors.text1)
                    )
            }
        }
    }
}

struct LanguageDropdownView_Previews: PreviewProvider {
    static var previews: some View {
        AppLocalizedPreview(language: "lv")
        LanguageDropdownView()
    }
}

extension LanguageDropdownView {
    @ViewBuilder
    private func makeFlagImageView() -> some View {
        Image(AppImages.makeLanguageFlagName(language: loc.languageCode), bundle: SwedDesignSystemResources.bundle)
            .resizable()
            .scaledToFit()
            .frame(width: 20)
    }
}
