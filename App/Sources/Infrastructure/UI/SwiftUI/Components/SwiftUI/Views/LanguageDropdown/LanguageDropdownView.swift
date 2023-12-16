//
//  LanguageDropdownView.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 28/05/2023.
//

import SwiftUI
import DevToolsUI

struct LanguageDropdownView: View {
    
    @ObservedObject var loc: AppLocalizationObserver = Composition.resolve()
    
    var body: some View {
        VStack {
            HStack {
                makeFlagImageView()
                Image(systemName: "chevron.down")
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
        Image(SWEDBANKAsset.Images.makeLanguageFlagName(language: "lv"))
            .resizable()
            .scaledToFit()
            .frame(width: 20)
    }
}
