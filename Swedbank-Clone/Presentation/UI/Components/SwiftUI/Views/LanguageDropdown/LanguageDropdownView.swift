//
//  LanguageDropdownView.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 28/05/2023.
//

import SwiftUI
import DevToolsUI
import DevToolsLocalization

struct LanguageDropdownView: View {
    
    @ObservedObject var loc = RuntimeLocalizationObserver()
    
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
        RuntimeLocalizedPreview(language: "lv")
        LanguageDropdownView()
    }
}

extension LanguageDropdownView {
    @ViewBuilder
    private func makeFlagImageView() -> some View {
        let loc = DI.container.resolve(RuntimeLocalization.self)!
        Image(Globals.makeLanguageFlagName(language: loc.getCurrentLanguage()))
            .resizable()
            .scaledToFit()
            .frame(width: 20)
    }
}
